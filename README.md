# README
## Tea's Seat

A tea subscription service that provides the ability to view a customer's subscriptions, allow the assignment of new subscriptions to a customer, and gives the chance to set currently assigned subscriptions as cancelled.

<a name="readme-top"></a>

<details>
  <summary>Table of Contents</summary>
  <ul list-style-position="inside">
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#learning-goals">Learning Goals</a></li>
        <li><a href="#built-with">Built With</a></li>
        <li><a href="#roadmap">Roadmap</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <li>
      <a href="#usage">Usage</a>
      <ul>
        <li><a href="#endpoints">Endpoints</a></li>
      </ul>
    </li>
    <li>
      <a href="#contributing">Contributing</a>
      <ul>
        <li><a href="#developers">Developers</a></li>
        <li><a href="#project-managers-instructors">Project Managers-Instructors</a></li>
      </ul>
    </li>
  </ol>
</details>

## About the Project
  
  ### Production Links
  
  * [Github](https://github.com/teas_seat) <br>

  ### Learning Goals

  * Microservice integration and implementation
  * Service integration and implementation
  * Efficient API exposure

  ### Built With

  [![Ruby]][Ruby-url] [![Rails]][Rails-url][![Postgres]][Postgres-url]
  [![Postman]][Postman-url][![CircleCI]][CircleCI-url]

  ### Roadmap
  <details>
    <summary>Done</summary>
    - [x] Add Readme<br>
    - [x] Setup Repo and Push to Github<br>
    - [x] Readme: Outlines the learning goals<br>
    - [x] Readme: Clone and Setup<br>
    - [x] Readme: Happy Path Endpoint Use<br>
    - [x] Endpoints: Customers<br>
    - [x] Endpoints: Subscription<br>
    - [x] Endpoints: Teas<br>
    - [x] Testing: Customers<br>
    - [x] Testing: Subscription<br>
    - [x] Testing: Teas<br>
  </details>
  <details>
    <summary>In Progress</summary>
    - [] Testing: Expanded Sad Path<br>
  </details>

  <p align="right">(<a href="#readme-top">back to top</a>)</p>

## Getting Started

  ### Prerequisites

  * Ruby 2.7.4
  * Rails 5.2.8

  ### Installation

  _Below are instructions for forking and cloning this repo_

  1. Clone the repo
  ```sh
  git clone git@github.com:bGray88/teas_seat.git
  ```
  2. Install gems
  ```sh
  bundle install
  ```
  3. Setup the database
  ```js
  rails db:{create,migrate,seed}
  ```
  4. Run RSpec tests
  ```sh
  bundle exec rspec
  ```

  <p align="right">(<a href="#readme-top">back to top</a>)</p>

## Usage
  
  ### Schema

  ![alt text](app/assets/images/readme/read_me-schema.png)

  ### Endpoints
  
  ### Articles

  <details>
  <summary>Customer Subscriptions</summary><br>
  
  ### Create

  Example Request:

  ```js
  POST /api/v1/cust_sub

  {
    "customer": 
        {
            "customer_id": 2340
        },
    "subscription":
        {
            "subscription_id": 2850
        }
  }
  ```

  Example Response:

  ```js
  {
    "data": {
        "type": "subscription",
        "id": 2851,
        "attributes": {
            "title": "Standard",
            "price": 22.8,
            "status": "active",
            "frequency": "biannual"
        }
    }
  }
  ```

  </details>

  ### Index

  Example Request:

  ```js
  GET /api/v1/cust_subs

  {
    "customer": 
        {
            "customer_id": 2340
        }
  }
  ```

  Example Response:

  ```js
  {
    "data": [
        {
            "type": "subscription",
            "id": 2842,
            "attributes": {
                "title": "Bronze",
                "price": 39.8,
                "status": "active",
                "frequency": "annual"
            }
        },
        {
            "type": "subscription",
            "id": 2843,
            "attributes": {
                "title": "Basic",
                "price": 47.75,
                "status": "active",
                "frequency": "annual"
            }
        }
    ]
  }
  ```

  </details>


  </details>

  ### Update

  Example Request:

  **Available Statuses: 'active', 'cancelled'**

  ```js
  PATCH /api/v1/cust_sub

  {
    "cust_sub":
        {
            "id": 1445
        },
    "status": "cancelled"
  }
  ```

  Example Response:

  ```js
  {
    "message": "Subscription updated successfully"
  }
  ```

  </details>

  <p align="right">(<a href="#readme-top">back to top</a>)</p>

## Contributing

  Contributions are what make the open source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

  If you have a suggestion that would make this better, please fork the repo and create a pull request. You can also simply open an issue with the tag "enhancement".
  Don't forget to give the project a star! Thanks again!

  1. Fork the Project
  2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
  3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
  4. Push to the Branch (`git push origin feature/AmazingFeature`)
  5. Open a Pull Request

  ### Developers

  <div align="center">
    <img src="https://avatars.githubusercontent.com/u/111726505?v=4" alt="Profile" width="80" height="80">
    <p align="center">
      Brandon Gray<br>
      <a href="https://github.com/bGray88">Github: bGray88</a><br>
      <a href="https://www.linkedin.com/in/brandon-gray-67903689/">LinkedIn: Brandon Gray</a>
    </p>
  </div>

  <p align="right">(<a href="#readme-top">back to top</a>)</p>

  ### Project Managers-Instructors

  1. Juliet Eyraud

  <p align="right">(<a href="#readme-top">back to top</a>)</p>

  [Ruby]: https://img.shields.io/badge/-Ruby-CC342D?style=flat&logo=ruby&logoColor=white
  [Ruby-url]: https://www.ruby-lang.org/en/
  [Rails]: https://img.shields.io/badge/-Ruby%20on%20Rails-CC0000?style=flat&logo=rubyonrails&logoColor=white
  [Rails-url]: https://rubyonrails.org
  [Postgres]: https://img.shields.io/badge/-Postgres-4169E1?style=flat&logo=postgresql&logoColor=white
  [Postgres-url]: https://www.postgresql.org/
  [Postman]: https://img.shields.io/badge/-Postman-FF6C37?style=flat&logo=postman&logoColor=white
  [Postman-url]: https://www.postman.com/
  [CircleCI]: https://img.shields.io/badge/circle%20ci-%23161616.svg?style=flat&logo=circleci&logoColor=white
  [CircleCI-url]: https://circleci.com/
