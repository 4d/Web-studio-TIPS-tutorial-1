

C_LONGINT:C283($i)
C_LONGINT:C283(codeWindow)
C_TEXT:C284($label)

btnTrace:=False:C215

Case of 
		
	: (Form event code:C388=On Load:K2:1)
		
		codeWindow:=0
		
		ARRAY TEXT:C222(_TabTitles; 0)
		ARRAY TEXT:C222(_Descriptions; 0)
		ARRAY TEXT:C222(_TabLineCode; 0)
		
		READ ONLY:C145([INFO:1])
		QUERY:C277([INFO:1]; [INFO:1]PageNumber:4<=9)
		ORDER BY:C49([INFO:1]; [INFO:1]PageNumber:4; >)
		SELECTION TO ARRAY:C260([INFO:1]TabTitle:3; _TabTitles; [INFO:1]Description:2; _Descriptions)
		
		QUERY:C277([INFO:1]; [INFO:1]PageNumber:4>=10)
		ORDER BY:C49([INFO:1]; [INFO:1]PageNumber:4; >)
		SELECTION TO ARRAY:C260([INFO:1]Description:2; _TabLineCode)
		
		Form:C1466.lightBlue:=New object:C1471("fill"; "#b3daff")
		Form:C1466.lightRed:=New object:C1471("fill"; "#ffccff")
		Form:C1466.lightGreen:=New object:C1471("fill"; "#9fdf9f")
		
		Form:C1466.ds:=ds:C1482
		//Form.ds:=Open datastore(New object("hostname";"127.0.0.1:8044");"demo")
		//
		
		viewTrace
		manageTexts
		RW
		
	: (Form event code:C388=On Page Change:K2:54)
		
		If (btnTrace)
			TRACE:C157
		End if 
		
		Case of 
				//Page 2 
			: (FORM Get current page:C276=2)
				Form:C1466.dbName:=Form:C1466.ds.getName()
				Form:C1466.statistics:=Form:C1466.ds.getStatistics()
				
				If (Application type:C494=4D Remote mode:K5:5)
					Form:C1466.type:="Client / Server"
				Else 
					Form:C1466.type:=Choose:C955(Form:C1466.ds.getInfo().localID=""; "local"; "REST Server")
				End if 
				
				//Page 3
			: (FORM Get current page:C276=3)
				Form:C1466.students:=Form:C1466.ds.Students.all()
				
				CALL FORM:C1391(Current form window:C827; "selectRow"; Form:C1466.students.first(); Form:C1466.students; "ListBoxStudents2")
				Form:C1466.attendedCourses:=Form:C1466.students.first().attendedCourses()
				
				//Page 4
			: (FORM Get current page:C276=4)
				Form:C1466.students:=Form:C1466.ds.Students.all()
				Form:C1466.student:=New object:C1471()
				OBJECT SET VISIBLE:C603(*; "creationOK"; False:C215)
				OBJECT SET VISIBLE:C603(*; "updateOK"; False:C215)
				OBJECT SET VISIBLE:C603(*; "CheckFailed"; False:C215)
				OBJECT SET ENABLED:C1123(*; "StudentEntry@"; False:C215)
				Form:C1466.action:=Null:C1517
				Form:C1466.day:=""
				Form:C1466.month:=""
				Form:C1466.year:=""
				
				//initHobbies
				
				enableSaveButton
				
				//Page 5
			: (FORM Get current page:C276=5)
				Form:C1466.schools:=Form:C1466.ds.Schools.all()
				Form:C1466.studentsAttending:=Null:C1517
				Form:C1466.viewAll:=False:C215
				
				CALL FORM:C1391(Current form window:C827; "selectRow"; Form:C1466.schools.first(); Form:C1466.schools; "ListBoxSchools")
				Form:C1466.schoolInfo:=Form:C1466.schools.first().info()
				Form:C1466.studentsAttending:=Form:C1466.schools.first().courses.first().students()
				OBJECT SET ENABLED:C1123(*; "CheckBoxViewAll"; True:C214)
				
				//Page 6
			: (FORM Get current page:C276=6)
				Form:C1466.students:=Form:C1466.ds.Students.all()
				CALL FORM:C1391(Current form window:C827; "selectRow"; Form:C1466.students.first(); Form:C1466.students; "ListBoxStudents3")
				Form:C1466.availableCourses:=Form:C1466.students.first().notAttendedCourses()
				Form:C1466.registeredCourses:=Form:C1466.students.first().attendedCourses()
				enableAddRemoveButtons
				OBJECT SET VISIBLE:C603(*; "CoursesTitle@"; Form:C1466.selectedStudent#Null:C1517)
				
				//Page 7
			: (FORM Get current page:C276=7)
				Form:C1466.students:=Form:C1466.ds.Students.all()
				CALL FORM:C1391(Current form window:C827; "selectRow"; Form:C1466.students.first(); Form:C1466.students; "ListBoxStudents4")
				Form:C1466.studentCourses:=Form:C1466.students.first().attendedCourses()
				Form:C1466.attendedSchools:=Form:C1466.studentCourses.school
				If (Form:C1466.attendedSchools.length#0)
					CALL FORM:C1391(Current form window:C827; "selectRow"; Form:C1466.attendedSchools.first(); Form:C1466.attendedSchools; "LBAttendedSchools")
					Form:C1466.attendedCourses:=Form:C1466.studentCourses.and(Form:C1466.attendedSchools.first().courses)
				Else 
					Form:C1466.attendedCourses:=Null:C1517
				End if 
		End case 
		
		//Code window (FunctionCode Form)
		If (Num:C11(codeWindow)#0)
			CALL FORM:C1391(codeWindow; "fillFunctionCode"; FORM Get current page:C276; "")
		End if 
		
		viewTrace
		manageTexts
		RW
		
	: (Form event code:C388=On Unload:K2:2)
		
		If (Num:C11(codeWindow)#0)
			CALL FORM:C1391(codeWindow; "closeFunctionCode")
		End if 
		
End case 

