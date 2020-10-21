CREATE TABLE public.Students(
                Student_ID BIGINT NOT NULL ,
                Name VARCHAR NOT NULL,
                Email VARCHAR UNIQUE ,

                CONSTRAINT Student_pk PRIMARY KEY (Student_ID)
);

CREATE TABLE public.Lecturer(
                  Lecturer_ID BIGINT NOT NULL,
                  Name VARCHAR NOT NULL,
                  Experience BIGINT,

                  CONSTRAINT Lecturer_pk PRIMARY KEY (Lecturer_ID)
);

CREATE TABLE public.Courses(
                  Course_ID BIGINT NOT NULL,
                  Title VARCHAR NOT NULL,
                  Hours BIGINT NOT NULL,

                  CONSTRAINT Course_pk PRIMARY KEY (Course_ID)
);
CREATE TABLE public.Students_On_Course(
                 Student_ID BIGINT NOT NULL,
                 Course_ID BIGINT NOT NULL,

                 CONSTRAINT Students_On_Course_pk PRIMARY KEY(Student_ID,Course_ID),

                 CONSTRAINT Student_fk FOREIGN KEY(Student_ID)
                   REFERENCES public.Students(Student_ID)
                   ON DELETE NO ACTION
                   ON UPDATE NO ACTION,

                 CONSTRAINT Course_fk FOREIGN KEY(Course_ID)
                   REFERENCES public.Courses(Course_ID)
                   ON DELETE NO ACTION
                   ON UPDATE NO ACTION


);


CREATE TABLE public.Lectures_On_Course(
                 Lecturer_ID BIGINT NOT NULL,
                 Course_ID BIGINT NOT NULL,

                 CONSTRAINT Lectures_On_Course_pk PRIMARY KEY(Lecturer_ID,Course_ID),

                 CONSTRAINT Lecturer_fk FOREIGN KEY(Lecturer_ID)
                   REFERENCES public.Lectures(Lecturer_ID)
                   ON DELETE NO ACTION
                   ON UPDATE NO ACTION,

                 CONSTRAINT Course_fk FOREIGN KEY(Course_ID)
                   REFERENCES public.Courses(Course_ID)
                   ON DELETE NO ACTION
                   ON UPDATE NO ACTION

);

CREATE TABLE public.Marks(
               Student_ID BIGINT NOT NULL,
               Course_ID BIGINT NOT NULL,
               Date_Of_Work DATE NOT NULL,
               Mark INT ,
               Attendance BOOLEAN,
               CONSTRAINT Marks_pk PRIMARY KEY(Student_ID,Course_ID,Date_Of_Work),

               CONSTRAINT Student_Marks_fk FOREIGN KEY(Student_ID)
                   REFERENCES public.Students(Student_ID)
                   ON DELETE NO ACTION
                   ON UPDATE NO ACTION,

                 CONSTRAINT Course_Marks_fk FOREIGN KEY(Course_ID)
                   REFERENCES public.Courses(Course_ID)
                   ON DELETE NO ACTION
                   ON UPDATE NO ACTION

);

CREATE TABLE public.Schedules(
               Course_ID BIGINT NOT NULL,
               Lecturer_ID BIGINT NOT NULL,
               Date_Of_Lesson Date NOT NULL,
               Time_Begin TIME ,
               Time_End TIME,
               CONSTRAINT Schedule_pk PRIMARY KEY(Course_ID,Date_Of_Lesson),

               CONSTRAINT Lecturer_fk FOREIGN KEY(Lecturer_ID)
                   REFERENCES public.Lectures(Lecturer_ID)
                   ON DELETE NO ACTION
                   ON UPDATE NO ACTION,

                 CONSTRAINT Course_fk FOREIGN KEY(Course_ID)
                   REFERENCES public.Courses(Course_ID)
                   ON DELETE NO ACTION
                   ON UPDATE NO ACTION
);
