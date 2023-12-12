from django.urls import path
from .views import GetBooks, AddBook, SingleBook

urlpatterns = [
    path("getBooks", GetBooks.as_view()),
    path("addPerson", AddBook.as_view()),
    path("SingleBook/<int:pk>", SingleBook.as_view()),
]