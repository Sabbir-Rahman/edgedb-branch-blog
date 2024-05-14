module default {
    type User {
        required property name -> str;
        required property email -> str {
            constraint exclusive;
            constraint max_len_value(100);
        }
        multi link orders -> Order;
    }

    type Product {
        required property name -> str;
        required property price -> float64;
        multi link orders -> Order;
    }

    type Salesman {
        required property name -> str;
        multi link orders -> Order;
    }

    type Order {
        required property quantity -> int64;
        required link user -> User;
        required link product -> Product;
        optional link salesman -> Salesman;
        property total -> float64 {
            using (SELECT .product.price * .quantity);
        }
    }
}