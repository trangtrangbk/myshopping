/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Utils;

import java.util.List;
import model.Cart;

/**
 *
 * @author duyth
 */
public class Process {
    public static long totalPrice(List<Cart> cartItems) {
        int count = 0;
        for (Cart list: cartItems) {
            count += list.getProduct().getPrice() * list.getQuatity();
        }
        return count;
    }

    public static int  CheckProduct(int id, List<Cart> carts) {
        int index = -1;
        for(int i = 0; i < carts.size(); i++){
          
            if(carts.get(i).getProduct().getId() == id){
                index = i;
            }
    }
        return index;
    }
    
}
