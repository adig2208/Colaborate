from . import db
from flask_login import UserMixin

class Users(UserMixin, db.Model):
    __tablename__ = 'users'

    id = db.Column(db.Integer, primary_key=True)
    

    email = db.Column(db.String(100), unique=True)

    password = db.Column(db.String(100))

    username = db.Column(db.String(1000))

class OriginalFiles(UserMixin, db.Model):
    __tablename__ = 'original_files'

    file_id = db.Column(db.Integer, primary_key=True)


    fileName = db.Column(db.String(200))

    md5 = db.Column(db.String(200))

class MappedFiles(UserMixin, db.Model):
    __tablename__ = 'mapped_files'

    mapped_id = db.Column(db.Integer, primary_key=True)

    user_id = db.Column(db.Integer, db.ForeignKey('users.id'))
    

    fileName = db.Column(db.String(200))

    original_id = db.Column(db.Integer, db.ForeignKey('original_files.file_id'))
