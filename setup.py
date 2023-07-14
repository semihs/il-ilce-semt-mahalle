try:
    from setuptools import setup
except ImportError:
    from distutils.core import setup

config = {
    'description': 'Ptt Pk Database',
    'author': '@semihs',
    'url': 'github.com/semihs/ptt-pk',
    'author_email': 'semihsari@gmail.com',
    'version': '0.1',
    'install_requires': ['pymysql', 'openpyxl', 'python-slugify', 'cryptography'],
    'packages': ['src/ptt-pk'],
    'scripts': [],
    'name': 'ptt-pk'
}

setup(**config)
