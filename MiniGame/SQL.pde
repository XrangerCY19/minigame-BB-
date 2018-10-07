String user = "root";
String pass = "";
String database = "game";
String username = "";
int status = 0;
int highscore = 0;
int increment = 0;
int coin = 0;

void connectSQL() {
  db = new MySQL( this, "localhost", database, user, pass );
  db.connect();
  db.query("SELECT * FROM loginreg");
  while (db.next()) {
    username = db.getString("u_username");
    coin = db.getInt("u_coins");
    status = db.getInt("loged");
    if(status == 1){
      break;
    }
  }
  db.query("SELECT * FROM loginreg");
  while(db.next()) {
    increment = db.getInt("u_highscore");
    if(increment > highscore) {
      highscore = increment;
    }
  }
  println(coin);
}
