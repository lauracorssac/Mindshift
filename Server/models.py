from enum import Enum
import uuid
from pydantic import BaseModel

class EducationBackground(str, Enum):
    BACHELOR = "bachelor"
    MASTER = "master"
    DOCTORATE = "doctorate"
    NONE = "none"
    HIGH_SCHOOL = "highschool"

class Gender(str, Enum):
    FEMALE = "female"
    MALE = "male"
    NONE = "none"
    OTHER = "other"

class User(BaseModel):
    id: uuid.UUID
    gender: Gender = Gender.NONE
    education: EducationBackground | None = None
    birthdate: str = ""
    race: str = ""
    profession: str = ""