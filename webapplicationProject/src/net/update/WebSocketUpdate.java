package net.update;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.AbstractMap;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.CopyOnWriteArrayList;
import java.util.concurrent.CopyOnWriteArraySet;
import java.util.concurrent.atomic.AtomicInteger;

import javax.servlet.http.HttpSession;
import javax.websocket.EndpointConfig;
import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import Utilities.ContextVariable;
import Utilities.DatabaseConnection;

@ServerEndpoint(value = "/statusupdate/", configurator = WebsocketConfigurator.class)
public class WebSocketUpdate {

	private static final AbstractMap<String, WebSocketUpdate> dataMap = new ConcurrentHashMap<>();
	private static final Set<WebSocketUpdate> clientConnections = new CopyOnWriteArraySet<>();
		
	private static final String ADMIN_PREFIX = "admin";
	private static final String STORE_PREFIX = "store";
	
	
	private final int 		STATUS = 0;
	private final int 		ID = 1;

	private Session 		session;
	private HttpSession 	httpSession;
	
	private String 			orderId;
	
	private boolean 		isStore;
	private boolean 		isAdmin;
	private boolean 		isOrderClient;
	
	@OnOpen
	public void start(Session session, EndpointConfig config) 
	{
		this.session = session;
		this.httpSession = (HttpSession) config.getUserProperties().get(HttpSession.class.getName());

		this.isStore = 			httpSession.getAttribute("store") != null;
		this.isAdmin = 			httpSession.getAttribute("admin") != null;
		this.isOrderClient = 	httpSession.getAttribute("orderId") != null;

		if(isStore)
			this.orderId = STORE_PREFIX;
		else if(isAdmin)
			this.orderId = ADMIN_PREFIX;
		else
		{
			if(isOrderClient)
				this.orderId = (String) httpSession.getAttribute("orderId");
			clientConnections.add(this);
		}
				
		if(orderId != null)
			dataMap.putIfAbsent(orderId, this);
		
		System.out.println("Num of cliend in website: " + clientConnections.size());
	}

	@OnClose
	public void closed() 
	{
		if(!isStore || !isAdmin)
			clientConnections.remove(this);
		
		if(orderId != null)
			dataMap.remove(this.orderId);
	}

	@OnMessage
	public void message(String message) 
	{
		try 
		{
			
			if (isStore)
				doClientMessage(message);
			else if (isAdmin)
				doAllClientMessage(message);
			else
				doStoreMessage(message);
			
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	private void doAllClientMessage(String message) throws IOException
	{
		for(WebSocketUpdate wsp : clientConnections)
		{
			synchronized(wsp)
			{
				wsp.session.getBasicRemote().sendText("5:"+message);
			}
		}
	}

	private void doClientMessage(String message) throws IOException {
		
		try {
			String db = "storedb";
			String username = "rodolfouser";
			String password = "poldz123";
		    String sql = "UPDATE storedb.order SET status = ? WHERE order_id = ?";
		    
		    String [] data = message.split(":");
		    
			int status = Integer.parseInt(data[STATUS]);
			String id = data[ID];
			
			if(status == 4)
			{
				clearOrder(status, id);
				return;
			}
			
			Connection c = DatabaseConnection.createDataBaseConnection(db, username, password);
			PreparedStatement prep = c.prepareStatement(sql);

			if(status == ContextVariable.Status.ORDER_DELIVERED.ordinal())
			{
				prep.setInt(1, status);
				prep.setString(2, id);
			} else if(status == ContextVariable.Status.PREP_PIZZA.ordinal())
			{
				prep.setInt(1, status);
				prep.setString(2, id);
			} else if(status == ContextVariable.Status.BAKE_PIZZA.ordinal())
			{
				prep.setInt(1, status);
				prep.setString(2, id);
			} else if(status == ContextVariable.Status.OUT_FOR_DELIVERY.ordinal())
			{
				prep.setInt(1, status);
				prep.setString(2, id);
			}
			
		    prep.executeUpdate();
		    DatabaseConnection.closeDataBaseConnectionWithPreparred(c, prep);
			
			dataMap.get(id).session.getBasicRemote().sendText(status+":s");

		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		} catch (NumberFormatException e) {
			e.printStackTrace();
		}
		
	}

	private void clearOrder(int status, String id) throws IOException
	{
		String db = "storedb";
		String username = "rodolfouser";
		String password = "poldz123";
		String clearOrderId = id;
		String sql = "DELETE FROM storedb.order WHERE order_id = ? ";
		
		Connection c;
		try {
			c = DatabaseConnection.createDataBaseConnection(db, username, password);
			PreparedStatement prep = c.prepareStatement(sql);

			prep.setString(1, clearOrderId);
			prep.executeUpdate();
			DatabaseConnection.closeDataBaseConnectionWithPreparred(c, prep);
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		
		dataMap.get(id).session.getBasicRemote().sendText(status+":s");
	}
	private void doStoreMessage(String message) throws IOException {
		dataMap.get("store").session.getBasicRemote().sendText("n");
	}
}
