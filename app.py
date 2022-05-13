from app import create_app
from os import path

if __name__ == "__main__":
    app = create_app()

    # Check if db.sqlite file exists or not. If not then create db.sqlite
    if not path.exists("app/db.sqlite"):
        with app.app_context():
            from app import db
            db.create_all()

    app.run(host ='0.0.0.0', port = 8080, debug = True)