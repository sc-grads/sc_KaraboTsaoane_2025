from flask.views import MethodView
from flask_smorest import Blueprint , abort
from passlib.hash import pbkdf2_sha256 #This is a hashing Algorithm

from db import db 
from models import UserModel
from schemas import UserSchema

blp = Blueprint ("users" , "users" , description = "Operations on users")

blp.route("/register")
class UserRegister(MethodView):
    @blp.arguments(UserSchema)
    def post(self , user_data):
        if UserModel.query.filter(UserModel.username == user_data["username"]).first():
            abort(409 , message ="A user already exists")

            user = UserModel(
                username = user_data["username"] ,
                password =pbkdf2_sha256.hash(user_data["password"]) #To encrypt the data from user
               
            )
            db.session.add(user)
            db.session.commit()

            return {"message": "User created successfully"} , 201
