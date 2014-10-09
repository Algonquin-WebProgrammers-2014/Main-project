package Utilities;

import pizza.SpecialPizza;
import Utilities.ContextVariable.Size;

public class Util {

	public static boolean isEmptyAndZero(String check){
		return  check == null || check.isEmpty() || check.equals("0");
	}
	
	public static void addPizzaToList(int count, String type, Size size, String name, String initial, PizzaCollection pizza){
		for(int i = 0; i < count; i++){
			if(type.equals("sp"))
				pizza.add(new SpecialPizza(name, size, initial));
		}
	}
}
