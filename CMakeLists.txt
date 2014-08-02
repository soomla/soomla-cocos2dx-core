#Mandatory commands to use wkcmake
CMAKE_MINIMUM_REQUIRED(VERSION 2.8)
INCLUDE ( "CMake/WkCMake.cmake" )
WkCMakeDir( "CMake" )

#Project Declaration
WkProject( SoomlaCocos2dxCore CXX )

WkIncludeDir ( "Soomla" )

#extra includes because App42 doesnt include headers with path...
set( ${PROJECT_NAME}_INCLUDE_DIRS "Soomla/domain"
	"Soomla/rewards"
	)
	

WkDepends("../jansson")


set( ${PROJECT_NAME}_INCLUDE_DIRS ${${PROJECT_NAME}_INCLUDE_DIRS} ${${PROJECT_NAME}_jansson_INCLUDE_DIRS})

WkLibraryBuild( SoomlaCocos2dxCore STATIC "Soomla")

set( ${PROJECT_NAME}_INCLUDE_DIRS ${${PROJECT_NAME}_INCLUDE_DIRS}
	CACHE PATH "Headers Directories"
)
