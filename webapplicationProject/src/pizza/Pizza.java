/**
 * This is the class for an object called Pizza.
 * 
 * @author Rodolfo Navalon
 * @version 0.2
 * @Documented by David Yu
 * **/
package pizza;

import java.io.Serializable;

import Utilities.ContextVariable.Size;

public class Pizza implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = -2392686731442148056L;
	
	private Size size;
	private String name;
	private String initial;
	
	/**
	 * This is the Constructor
	 * 
	 * @author Rodolfo Navalon
	 * 
	 * documented by: David Yu
	 * **/
	public Pizza(String name, Size size, String initial){
		this.name = name;
		this.size = size;
		this.initial = initial;
	}
	
	/**
	 * Gets the name of the Pizza Object
	 * 
	 * @author Rodolfo Navalon
	 * 
	 * documented by: David Yu
	 * **/
	public String getName(){
		return this.name;
	}
	
	/**
	 * Gets the size of the Pizza Object
	 * 
	 * @author Rodolfo Navalon
	 * 
	 * documented by: David Yu
	 * **/
	public Size getSize(){
		return this.size;
	}
	
	/**
	 * Gets the Initial of the Pizza Object
	 * 
	 * @author Rodolfo Navalon
	 * 
	 * documented by: David Yu
	 * **/
	public String getInitial(){
		return this.initial;
	}
}
