db.createUser(
    {
      user: "admin",
      pwd: "keyPassword",
      roles: [ { role: "userAdminAnyDatabase", db: "admin" } ]
    }
  );