# V.U.M.S.Y (Vulnerability Management System)



## Installation
Follow the next (as admin):

```py
pip install --upgrade pip
pip install -r /path/to/requirements.txt
```

## Usage
Example in cli folder run:

```py
python .\vumsy-cli.py -j "C:\Users\User\Desktop\vumsy\cli\analysis\sirgeqa.sre.gob.mx 2021-11-05.json"
```

## Support
Tell people where they can go to for help. It can be any combination of an issue tracker, a chat room, an email address, etc.

## Roadmap
If you have ideas for releases in the future, it is a good idea to list them in the README.

## Contributing
State if you are open to contributions and what your requirements are for accepting them.

For people who want to make changes to your project, it's helpful to have some documentation on how to get started. Perhaps there is a script that they should run or some environment variables that they need to set. Make these steps explicit. These instructions could also be useful to your future self.

You can also document commands to lint the code or run tests. These steps help to ensure high code quality and reduce the likelihood that the changes inadvertently break something. Having instructions for running tests is especially helpful if it requires external setup, such as starting a Selenium server for testing in a browser.

## Authors and acknowledgment
Show your appreciation to those who have contributed to the project.

## License
For open source projects, say how it is licensed.

## Project status
If you have run out of energy or time for your project, put a note at the top of the README saying that development has slowed down or stopped completely. Someone may choose to fork your project or volunteer to step in as a maintainer or owner, allowing your project to keep going. You can also make an explicit request for maintainers.

## Design

GrupoScope 

Scope 1 Borrar Socpe 1

Scope 2

Scope 3





# 1 VUMSY API


Setup env

```
virtualenv venv
```

For Linux/Mac

```
source venv/bin/activate
```

For Windows

```
source venv/Scripts/activate
```



```
env\Scripts\activate
```

Install package

```
pip install fastapi uvicorn
```

Start server 

```
uvicorn index:app --reload

python -m uvicorn index:app --reload --host 0.0.0.0 --port 3000

http://localhost:3000/docs
```

![Fastapi-mongodb](https://user-images.githubusercontent.com/16520789/118378578-6ec43e80-b5f2-11eb-99bb-1a28abe9b5ed.png)

# 2 VUMSY WEB APP


Setup env

```
cd %userprofile%\Desktop\Tools\vumsy\web_app
```

Run development mode: 

```
flutter run -d chrome
```





