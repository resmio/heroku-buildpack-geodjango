#Heroku buildpack: GeoDjango

This is a [Heroku buildpack](http://devcenter.heroku.com/articles/buildpacks) for GeoDjango apps.
It extends the original Python buildpack by adding GEOS, Proj.4 and GDAL, per the [GeoDjango installation
instructions](https://docs.djangoproject.com/en/dev/ref/contrib/gis/install/).

--- 

This is a [Heroku buildpack](http://devcenter.heroku.com/articles/buildpacks) for Python apps.

[![Build Status](https://secure.travis-ci.org/dulaccc/heroku-buildpack-geodjango.png?branch=master)](http://travis-ci.org/dulaccc/heroku-buildpack-geodjango)

---

##Configuration

You need to set two Django settings in order for `GEOS` and `GDAL` to work properly.

**settings.py**

```python
from os import environ

GEOS_LIBRARY_PATH = environ.get('GEOS_LIBRARY_PATH')
GDAL_LIBRARY_PATH = environ.get('GDAL_LIBRARY_PATH')
```

##Usage

The buildpack will detect your app as Python if it has the file `requirements.txt` in the root.

It will use Pip to install your dependencies, vendoring a copy of the Python runtime into your slug.

```sh
$ heroku create --stack cedar --buildpack http://github.com/dulaccc/heroku-buildpack-geodjango/

$ git push heroku master
...
-----> Fetching custom git buildpack... done
-----> Python app detected
-----> No runtime.txt provided; assuming python-2.7.6.
-----> Preparing Python runtime (python-2.7.6)
-----> Installing Setuptools (2.1)
-----> Installing Pip (1.5.2)
-----> Checking for GDAL
       Fetching and installing GEOS 3.3.2
       Caching ...
       GEOS installed
-----> Checking for Proj.4
       Fetching and installing Proj.4 4.7.0
       Installing ...
       Proj.4 installed
-----> Checking for GDAL
       Fetching and installing GDAL 1.8.1
       Installing ...
       GDAL installed
-----> Installing dependencies using Pip (1.5.2)
       Downloading/unpacking Flask==0.7.2 (from -r requirements.txt (line 1))
       Downloading/unpacking Werkzeug>=0.6.1 (from Flask==0.7.2->-r requirements.txt (line 1))
       Downloading/unpacking Jinja2>=2.4 (from Flask==0.7.2->-r requirements.txt (line 1))
       Installing collected packages: Flask, Werkzeug, Jinja2
       Successfully installed Flask Werkzeug Jinja2
       Cleaning up...

... etc.
```

## Notes

All libraries are stored in the directory `/app/.geodjango`.

## Specify a Runtime

You can also provide arbitrary releases Python with a `runtime.txt` file.

    $ cat runtime.txt
    python-3.4.2

Runtime options include:

- python-2.7.8
- python-3.4.2
- pypy-2.4.0 (unsupported, experimental)
- pypy3-2.3.1 (unsupported, experimental)

Other [unsupported runtimes](https://github.com/heroku/heroku-buildpack-python/tree/master/builds/runtimes) are available as well.

## Contact

[Pierre Dulac](http://github.com/dulaccc)  
[@dulaccc](https://twitter.com/dulaccc)
