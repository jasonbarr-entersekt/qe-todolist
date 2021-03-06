# Getting the environment and tests going

Two directories have been added to the repo, api/ and e2e/. The API dir contains postman tests which will hit 
the endpoint configured in api/envs/localhost.postman_environment.json.

E2e contains a set of robotframework tests that will hit the dockerised instance and do a few UI checks, as well 
as sending some http requests to get the UI into a state where some UI scenario can be checked (I find it easier to 
drive the UI through http/api requests than setup longwinded scenarios using the UI.)

You'll need to build those out using docker, as I've added a docker-compose yaml file to create a setup where I have
separate containers for the tests and the instance running the node server.

From root run the following command:

  * docker build -t qe-todolist .
  
cd to api and build out the api Dockerfile:

  * docker build -t api-todolist .
  
Lastly, cd to the e2e dir and build that out:

  * docker build -t e2e-todolist .
  
Head back to the root directory and run docker-compose:

 * docker-compose up
 
You should see output like this (this output is from an early version of the robot file):

     ~/stashes/qe-todolist   master ● ?  docker-compose up                                                                                                                                                     ✔  3695  10:53:49
    Creating qe-todolist_node-service_1 ... done
    Creating qe-todolist_postman_1      ... done
    Creating qe-todolist_e2e_1          ... done
    Attaching to qe-todolist_node-service_1, qe-todolist_postman_1, qe-todolist_e2e_1
    node-service_1  |
    node-service_1  | > qe-todolist@0.1.0 start /src
    node-service_1  | > node app.js
    node-service_1  |
    postman_1       | 4.5.5
    e2e_1           | ==============================================================================
    e2e_1           | Todolist :: This is a suite of tests for the Entersekt assessment.
    e2e_1           | ==============================================================================
    e2e_1           | Add a new todolist item :: Create item.                               | FAIL |
    e2e_1           | Test case contains no keywords.
    e2e_1           | ------------------------------------------------------------------------------

At least we know the UI tests are being called properly.

The API tests should give the following output at the command line:

qe-todolist

    → create
      POST http://localhost:8081/todo/add [200 OK, 1.1KB, 158ms]
      ✓  first element should have correct name'
      ✓  response should be ok
      ✓  page must have h1 heading

    → edit
      POST http://localhost:8081/todo/edit/0 [200 OK, 1.07KB, 16ms]
      ✓  response should be ok

    → delete
      GET http://localhost:8081/todo/delete/0 [200 OK, 726B, 10ms]
      ✓  response should be ok

    ┌─────────────────────────┬───────────────────┬───────────────────┐
    │                         │          executed │            failed │
    ├─────────────────────────┼───────────────────┼───────────────────┤
    │              iterations │                 1 │                 0 │
    ├─────────────────────────┼───────────────────┼───────────────────┤
    │                requests │                 3 │                 0 │
    ├─────────────────────────┼───────────────────┼───────────────────┤
    │            test-scripts │                 3 │                 0 │
    ├─────────────────────────┼───────────────────┼───────────────────┤
    │      prerequest-scripts │                 1 │                 0 │
    ├─────────────────────────┼───────────────────┼───────────────────┤
    │              assertions │                 5 │                 0 │
    ├─────────────────────────┴───────────────────┴───────────────────┤
    │ total run duration: 292ms                                       │
    ├─────────────────────────────────────────────────────────────────┤
    │ total data received: 2.29KB (approx)                            │
    ├─────────────────────────────────────────────────────────────────┤
    │ average response time: 61ms [min: 10ms, max: 158ms, s.d.: 68ms] │
    └─────────────────────────────────────────────────────────────────┘
