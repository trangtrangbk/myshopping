package model;

public class Cart {

    private int id;
    private Product product;
    private int quatity;

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public int getQuatity() {
        return quatity;
    }

    public void setQuatity(int quatity) {
        this.quatity = quatity;
    }

    public Cart() {
        super();
    }

    public Cart(int id, Product product, int quatity) {
        this.id = id;
        this.product = product;
        this.quatity = quatity;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

   

    @Override
    public String toString() {
        return "Cart [product=" + product + ", quatity=" + quatity + "]";
    }

}
