/**
 * The final variable to be access by the store
 * 
 * @author Rodolfo Navalon
 * @version 0.1
 * @see Authenticator
 * **/
package Utilities;

public class ContextVariable {
	public enum Status {
		ORDER_DELIVERED, PREP_PIZZA, BAKE_PIZZA, OUT_FOR_DELIVERY
	}
	
	public enum Size {
		SMALL, PREP_PIZZA, BAKE_PIZZA, OUT_FOR_DELIVERY
	}
}
