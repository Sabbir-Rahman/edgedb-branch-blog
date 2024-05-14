CREATE MIGRATION m1bq2474hanw45isp5c3inrbzijz6c6poxneharmcf5qvf7km77whq
    ONTO m1o7e2ippinx46fi6rt5wfiqh6wqeatwaxg6zawobpms3ldvqqehrq
{
  CREATE TYPE default::Salesman {
      CREATE MULTI LINK orders: default::Order;
      CREATE REQUIRED PROPERTY name: std::str;
  };
  ALTER TYPE default::Order {
      CREATE OPTIONAL LINK salesman: default::Salesman;
  };
};
