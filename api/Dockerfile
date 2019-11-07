FROM postman/newman_alpine33

RUN npm install -g newman
RUN npm install -g newman-reporter-htmlextra
RUN pwd

ENTRYPOINT ["newman", "run", "api/collections/qe-todolist.postman_collection.json", "-e api/envs/localhost.postman_environment.json", "--reporters=cli,htmlextra", "--reporter-htmlextra-export todolist.html"]