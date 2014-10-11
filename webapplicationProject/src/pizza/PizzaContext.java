/**
 * Collection of the same type of Pizza
 * 
 * @author Rodolfo Navalon
 * @version 0.2
 * @Documented by David Yu
 * **/
package pizza;

import Utilities.ContextVariable.Size;

public class PizzaContext {

	private int smallCount = 0;
	private int mediumCount = 0;
	private int largeCount = 0;
	private int xLargeCount = 0;
	
	private Pizza pizza;
	
	/**
	 * Sets the pizza object to this class
	 * and increment its respective size to the collection
	 * 
	 * @author Rodolfo Navalon
	 * 
	 * documented by: David Yu
	 * **/
	public PizzaContext(Pizza pizza){
		this.pizza = pizza;
		incrementBySize(pizza.getSize());
	}
	
	/**
	 * Increment based on what size was chosen
	 * and call its respective method based on choice
	 * 
	 * @author Rodolfo Navalon
	 * 
	 * documented by: David Yu
	 * **/
	public void incrementBySize(Size size){
		switch(size) 
		{
			case SMALL:
				incrementSmall();
				break;
			case MEDIUM:
				incrementMedium();
				break;
			case LARGE:
				incrementLarge();
				break;
			case XLARGE:
				incrementXLarge();
				break;
		}
	}
	
	/**
	 * Increment based on what size was chosen
	 * 
	 * @author Rodolfo Navalon
	 * 
	 * documented by: David Yu
	 * **/
	public void incrementSmall(){
		this.smallCount++;
	}
	
	public void incrementMedium(){
		this.mediumCount++;
	}
	
	public void incrementLarge(){
		this.largeCount++;
	}
	
	public void incrementXLarge(){
		this.xLargeCount++;
	}
	
	/**
	 * Get the amount for its respective size variable
	 * 
	 * @author Rodolfo Navalon
	 * 
	 * documented by: David Yu
	 * **/
	public int getSmallCount(){
		return this.smallCount;
	}
	
	public int getMediumCount(){
		return this.mediumCount;
	}
	
	public int getLargeCount(){
		return this.largeCount;
	}
	
	public int getxLargeCount(){
		return this.xLargeCount;
	}
	
	/**
	 * Set the amount for its respective size variable
	 * 
	 * @author Rodolfo Navalon
	 * 
	 * documented by: David Yu
	 * **/
	public void setSmallCount(int smallCount){
		this.smallCount = smallCount;
	}
	
	public void setMediumCount(int mediumCount){
		this.mediumCount = mediumCount;
	}
	
	public void setLargeCount(int largeCount){
		this.largeCount = largeCount;
	}
	
	public void setxLargeCount(int xLargeCount){
		this.xLargeCount = xLargeCount;
	}
	
	/**
	 * Get the pizza object
	 * 
	 * @author Rodolfo Navalon
	 * 
	 * documented by: David Yu
	 * **/
	public Pizza getPizza(){
		return this.pizza;
	}

}
