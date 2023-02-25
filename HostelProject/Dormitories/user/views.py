from django.shortcuts import render, redirect
from django.http import HttpResponse
from django.contrib.auth.decorators import login_required
from django.contrib.auth.views import LoginView
from django.contrib.auth import logout
from .forms import LoginUserForm, RegisterUserForm
from django.urls import reverse_lazy
from django.views.generic import CreateView
from django.contrib.auth.models import User
from .models import Student

@login_required(login_url='./login')
def userPage(request):
    if request.method == 'POST':
        firstname = request.POST['firstname']
        lastname = request.POST['lastname']
        faculty = request.POST['faculty']
        gender = request.POST['gender']
        location = request.POST['location']

        username = request.user.username
        user = User.objects.get(username = username)
        user_id = request.user.id
        
        student = Student.objects.filter(user_id=user_id).first()
        if not student:
            Student.objects.create(gender=gender, faculty=faculty, user_id=user_id)
        else :
            student.gender = gender
            student.faculty = faculty
            student.location = location
            student.save()

        user.first_name = firstname
        user.last_name = lastname
        user.save()
    
    username = request.user.username
    email = request.user.email
    firstname = request.user.first_name
    lastname = request.user.last_name
    data = {
        'username': username,
        'firstname': firstname,
        'lastname': lastname,
        'email': email,
    }
    return render(request, 'user/user_page.html', data)

class LoginUser(LoginView):
    form_class = LoginUserForm
    template_name = 'user/login.html'
    
    def get_success_url(self):
        return reverse_lazy('Userpage')

class RegisterUser(CreateView):
    form_class = RegisterUserForm
    template_name = 'user/register.html'
    success_url = reverse_lazy('login')

def UserLoggedIn(request):
    if request.user.is_authenticated == True:
        username = request.user.username
    else:
        username = None
    return username

def Logout(request):
    username = UserLoggedIn(request)
    if username != None:
        logout(request)
        url_match = reverse_lazy('mainPage')
        return redirect(url_match)

    