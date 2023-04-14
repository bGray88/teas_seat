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

  def self.cust_sub_and_subscription(cust_sub, subscription)
    {
      "data": {
        "type":       "cust_sub",
        "id":         cust_sub.id,
        "attributes": {
          "status":          cust_sub.status,
          "customer_id":     cust_sub.customer_id,
          "subscription_id": cust_sub.subscription_id,
          "subscription": {
            "type":       "subscription",
            "id":         cust_sub.subscription_id,
            "attributes": {
              "title":     subscription.sub_title,
              "price":     subscription.sub_price,
              "frequency": subscription.sub_frequency,
              "tea": {
                "type":      "tea",
                "id":        subscription.tea_id,
                "attributes":
                  {
                    "title":       subscription.tea_title,
                    "description": subscription.tea_description,
                    "temperature": subscription.tea_temperature,
                    "brew_time":   subscription.tea_brew_time
                  }
              }
            }
          }
        }
      }
    }
  end
end
