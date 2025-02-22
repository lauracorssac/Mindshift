from enum import Enum
import uuid
from pydantic import BaseModel

class User(BaseModel):
    id: uuid.UUID
    gender: str = ""
    education: str = ""
    birthdate: str = ""
    race: str = ""
    profession: str = ""