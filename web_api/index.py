from fastapi import FastAPI
from routes.user import user 
from routes.wda import wda
from fastapi.middleware.cors import CORSMiddleware

app = FastAPI()
app.include_router(user)
app.include_router(wda)

origins = ["*"]

app.add_middleware(
    CORSMiddleware,
    allow_origins=origins,
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)