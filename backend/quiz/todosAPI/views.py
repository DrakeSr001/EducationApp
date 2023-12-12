from .serializers import BookSerializer
from django.shortcuts import render
from rest_framework import generics
from .models import Books

class GetBooks(generics.ListAPIView):
    queryset = Books.objects.all()
    serializer_class = BookSerializer

class AddBook(generics.CreateAPIView):
    serializer_class = BookSerializer

class SingleBook(generics.RetrieveAPIView): # Read Task
    queryset = Books.objects.all()    
    serializer_class = BookSerializer