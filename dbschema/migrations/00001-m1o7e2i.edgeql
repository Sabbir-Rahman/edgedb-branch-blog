CREATE MIGRATION m1o7e2ippinx46fi6rt5wfiqh6wqeatwaxg6zawobpms3ldvqqehrq
    ONTO initial
{
  CREATE TYPE default::Order {
      CREATE REQUIRED PROPERTY quantity: std::int64;
  };
  CREATE TYPE default::Product {
      CREATE REQUIRED PROPERTY price: std::float64;
      CREATE MULTI LINK orders: default::Order;
      CREATE REQUIRED PROPERTY name: std::str;
  };
  ALTER TYPE default::Order {
      CREATE REQUIRED LINK product: default::Product;
      CREATE PROPERTY total := (SELECT
          (.product.price * .quantity)
      );
  };
  CREATE TYPE default::User {
      CREATE MULTI LINK orders: default::Order;
      CREATE REQUIRED PROPERTY email: std::str {
          CREATE CONSTRAINT std::exclusive;
          CREATE CONSTRAINT std::max_len_value(100);
      };
      CREATE REQUIRED PROPERTY name: std::str;
  };
  ALTER TYPE default::Order {
      CREATE REQUIRED LINK user: default::User;
  };
};
