from django.db import models

# Create your models here.
class Books(models.Model):
    bookName = models.CharField(max_length = 25)
    bookDesc = models.CharField(max_length = 250)
    bookImagePath = models.CharField(max_length= 2500)
    bookPrice = models.IntegerField()
    bookAuthorName = models.CharField(max_length= 25)
    bookPublisherName = models.CharField(max_length= 50)
    bookReleaseDate = models.DateTimeField()
    isRentable = models.BooleanField()
    isAvailable = models.BooleanField()