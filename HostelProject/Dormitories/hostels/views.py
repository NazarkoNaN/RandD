from django.shortcuts import render
from user.models import Student
from .models import Hostel, Room

def dormitoriePage(request):
    if request.user.is_authenticated == True:
        user_id = request.user.id
        student = Student.objects.filter(user_id=user_id).first()


        print(student.room_id)
        if(student.location == 'Kyiv'):
            return render(request, 'hostels/sorry.html')
        elif(student.room_id != None) :
            room = Room.objects.filter(id=student.room_id).first()
            hostel = Hostel.objects.filter(id=room.hostel_id).first()

            name = hostel.name
            location = hostel.location
            floor = room.floor
            number = room.number
            payment_status = student.payment_status
            data = {
                'name' : name,
                'location': location,
                'floor' : floor,
                'number' : number,
                'payment_status' : payment_status,
            }
            return render(request, 'hostels/dormitorie.html', data)
        else:
            return render(request, 'user/user_page.html')
    else:
        return render(request, 'user/login.html')