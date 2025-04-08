package ru.example.stream;

import java.util.List;

public class ProductMain {
    public static void main(String[] args) {
        Product p1 = new Product(1, "Milk", 100.0);
        Product p2 = new Product(2, "Cheese1", 150.0);
        Product p3 = new Product(3, "Cheese2", 200.0);
        Product p4 = new Product(4, "Cheese3", 300.0);
        Product p5 = new Product(5, "Cheese4", 400.0);
        Product p6 = new Product(6, "Cheese5", 500.0);
        Product p7 = new Product(7, "Cheese6", 600.0);
        Product p8 = new Product(8, "Cheese7", 700.0);
        Product p9 = new Product(9, "Cheese8", 800.0);
        Product p10 = new Product(10, "Cheese9", 900.0);
        Product p11 = new Product(11, "Cheese10", 1000.0);

        List<Product> products = List.of(p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11);

        System.out.println(getSaleProducts(products));

    }

    private static List<String> getSaleProducts(List<Product> products) {
        return products.stream()
                .filter(product -> product.price() <= 500)
                .map(Product::name)
                .toList();
    }
}