# Generated by Django 5.0 on 2023-12-07 09:03

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('todosAPI', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='books',
            name='bookImagePath',
            field=models.CharField(max_length=2500),
        ),
    ]