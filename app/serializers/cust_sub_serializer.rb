class CustSubSerializer
  def self.cust_sub(cust_sub)
    {
      "data": {
        "type":       "cust_sub",
        "id":         cust_sub.id,
        "attributes": {
          "status":          cust_sub.status,
          "customer_id":     cust_sub.customer_id,
          "subscription_id": cust_sub.subscription_id
        }
      }
    }
  end
end
