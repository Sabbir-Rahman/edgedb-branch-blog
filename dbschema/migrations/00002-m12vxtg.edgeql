CREATE MIGRATION m12vxtg67k7qdwakvrzohmiagvbzdbgtzue5vfd2otvrjkbtiushva
    ONTO m1o7e2ippinx46fi6rt5wfiqh6wqeatwaxg6zawobpms3ldvqqehrq
{
  CREATE TYPE default::Category {
      CREATE MULTI LINK products: default::Product;
      CREATE REQUIRED PROPERTY name: std::str;
  };
  ALTER TYPE default::Product {
      CREATE OPTIONAL LINK category: default::Category;
  };
};
