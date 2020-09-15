from flask import Flask, render_template, request, session, redirect
from flask_sqlalchemy import SQLAlchemy
from flask_mail import Mail
import json
from datetime import datetime
from werkzeug.utils import secure_filename
from math import ceil
import os

with open('config.json', 'r') as c:
    params = json.load(c)["params"]

local_server = True
app = Flask(__name__)
app.secret_key = 'super-secret-key'
app.config["UPLOAD_FOLDER"] = params['upload_location']
app.config.update(
    MAIL_SERVER = 'smtp.gmail.com',
    MAIL_PORT = '465',
    MAIL_USE_SSL = True,
    MAIL_USERNAME = params['gmail-user'],
    MAIL_PASSWORD=  params['gmail-password']
)
mail = Mail(app)

if local_server:
    app.config['SQLALCHEMY_DATABASE_URI'] = params['local_uri']
else:
    app.config['SQLALCHEMY_DATABASE_URI'] = params['prod_uri']

db = SQLAlchemy(app)

# sr , name , phone_num ,mes, date, email
# This class define table in DataBase
class Contacts(db.Model):
    sno = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(80), nullable=False)
    phone_num = db.Column(db.String(120), nullable=False)
    msg = db.Column(db.String(120), nullable=False)
    date = db.Column(db.String(12), nullable=True)
    email = db.Column(db.String(20), nullable=False)

class Posts(db.Model):
    sno = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String(80), nullable=False)
    slug = db.Column(db.String(120), nullable=False)
    content = db.Column(db.String(120), nullable=False)
    tagline = db.Column(db.String(120), nullable=False)
    date = db.Column(db.String(12), nullable=True)
    img_file = db.Column(db.String(12), nullable=True)
    

# nullable default is value is true


# Home Page
@app.route("/")
def home():
    # Pagination Logic
    # First Page
        # pre = #
        # next = page+1
    # Middle Page
        # pre = page-1
        # next = page+1
    # Last Page
        # pre = page-1
        # next = #

    posts = Posts.query.filter_by().all()
    # [0:params["no_of_posts"]]
    last = ceil(len(posts)/int(params['no_of_posts']))
    page = request.args.get('page')

    if (not str(page).isnumeric()):
        page = 1

    page = int(page)
    posts = posts[(page-1)*int(params['no_of_posts']): (page-1)*int(params['no_of_posts'])+page*int(params['no_of_posts'])]


    if (page == 1):
        prev = "#"
        next = "/?page="+ str(page+1)

    elif(page == last):
        prev = "/?page="+ str(page+1)
        next = "#"

    else:
        prev = "/?page="+ str(page-1)
        next = "/?page="+ str(page+1)
        


    return render_template ("index.html", params = params, posts = posts, prev = prev, next = next)

# About Page
@app.route("/about")
def about():
    return render_template("about.html", params = params)

@app.route("/post/<string:post_slug>", methods=['GET', 'POST'])
def post_route(post_slug):
    post = Posts.query.filter_by(slug = post_slug).first()
    return render_template ("post.html", params = params, post = post)

@app.route("/dashboard", methods=['GET', 'POST'])
def samplepost():

    if ('user' in session and session['user'] == params['admin_user']):
        posts = Posts.query.all()
        return render_template('dashboard.html', params = params, posts = posts)

    if request.method == 'POST':
        username = request.form.get('uname')
        userpass = request.form.get('pass')
        if (username == params['admin_user'] and userpass ==params['admin_password']):
            session['user'] = username
            posts = Posts.query.all()
            return render_template('dashboard.html', params = params, posts = posts)
        
    return render_template('login.html', params = params)
        

#Edit post by Admin Login
@app.route("/edit/<string:sno>",methods = ['GET', 'POST'])
def edit(sno):
    if ('user' in session and session['user'] == params['admin_user']):
        if request.method == "POST":
            box_title = request.form.get('title')
            tline = request.form.get('tline')
            slug = request.form.get('slug')
            content = request.form.get('content')
            img_file = request.form.get('img_file')
            date = datetime.now()

            if sno =='0':
                post = Posts(title = box_title, slug = slug, content = content, tagline = tline, img_file = img_file, date = date)
                db.session.add(post)
                db.session.commit()
            else:
                post = Posts.query.filter_by(sno=sno).first()
                post.title = box_title
                post.slug = slug
                post.content = content
                post.tagline = tline
                post.img_file = img_file
                post.date = date
                db.session.commit()
                return redirect("/edit/"+sno)


        post = Posts.query.filter_by(sno = sno).first()
        return render_template("edit.html", params = params, sno = sno, post = post)

# Uploader
# Contact page 
@app.route("/uploader", methods = ['GET', 'POST'])
def uploader():
    if ('user' in session and session['user'] == params['admin_user']):
        if (request.method == "POST"):
            f =  request.files['file1']
            f.save(os.path.join(app.config['UPLOAD_FOLDER'], secure_filename(f.filename)))
            return redirect('/dashboard')

#logout
@app.route("/logout")
def logout():
    session.pop("user")
    return redirect ('/')

# Delete Post
#Edit post by Admin Login
@app.route("/delete/<string:sno>",methods = ['GET', 'POST'])
def delete(sno):
    if ('user' in session and session['user'] == params['admin_user']):
        post = Posts.query.filter_by(sno = sno).first()
        db.session.delete(post)
        db.session.commit()
        return redirect('/dashboard')


# Contact page 
@app.route("/contact", methods = ['GET', 'POST'])
def contact():
    if(request.method=='POST'):
        name = request.form.get('name')
        email = request.form.get('email')
        phone = request.form.get('phone')
        message = request.form.get('message')
        entry = Contacts(name=name, phone_num = phone, msg = message, date= datetime.now(),email = email )
        db.session.add(entry)
        db.session.commit()
        mail.send_message(sender=email,
                          recipients = [params['gmail-user']],
                          body = "New Message from "+ name + "\n" +
                          "Email Address is "+ email + "\n" +
                          "Phone Number is "+ phone + "\n" +
                          "The Message is " + message
                          )
    return render_template('contact.html', params=params)


app.run(debug=True)



