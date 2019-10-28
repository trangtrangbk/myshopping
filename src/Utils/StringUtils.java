package Utils;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.Normalizer;
import java.util.List;
import java.util.regex.Pattern;
import model.Product;

public class StringUtils {

    public static String md5(String str) {
        MessageDigest md;
        String result = "";
        try {
            md = MessageDigest.getInstance("MD5");
            md.update(str.getBytes());
            BigInteger bi = new BigInteger(1, md.digest());

            result = bi.toString(16);
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
        return result;
    }

    public static String makeSlug(String title) {
        String slug = Normalizer.normalize(title, Normalizer.Form.NFD);
        Pattern pattern = Pattern.compile("\\p{InCombiningDiacriticalMarks}+");
        slug = pattern.matcher(slug).replaceAll("");
        slug = slug.toLowerCase();
        slug = slug.replaceAll("đ", "d");
        slug = slug.replaceAll("([^0-9a-z-\\s])", "");
        slug = slug.replaceAll("[\\s]", "-");
        slug = slug.replaceAll("(-+)", "-");
        slug = slug.replaceAll("^-+", "");
        slug = slug.replaceAll("-+$", "");
        return slug;
    }

    public static List<Product> sort(int id, List<Product> listProduct) {
        if (id == 0) {
            for (int i = 0; i < listProduct.size() - 1; i++) {
                for (int j = i; j < listProduct.size(); j++) {
                  if(listProduct.get(i).getPrice() > listProduct.get(j).getPrice() ){
                      Product tam = listProduct.get(i);
                      listProduct.set(i, listProduct.get(j));
                      listProduct.set(j, tam);
                  }
                }
            }
        }else{
                     for (int i = 0; i < listProduct.size() - 1; i++) {
                for (int j = i; j < listProduct.size(); j++) {
                  if(listProduct.get(i).getPrice() < listProduct.get(j).getPrice() ){
                      Product tam = listProduct.get(i);
                      listProduct.set(i, listProduct.get(j));
                      listProduct.set(j, tam);
                  }
                }
            }
        }
return listProduct;    
    }
}
