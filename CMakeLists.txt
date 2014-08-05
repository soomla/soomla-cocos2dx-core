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

include_directories(${${PROJECT_NAME}_INCLUDE_DIRS})

WkLibraryBuild( SoomlaCocos2dxCore STATIC "Soomla")


#Temporary work around wkcmake bug with dependencies at multiple levels
set(SoomlaCocos2dxCore_jansson_LIBRARIES "jansson" CACHE PATH "jansson Libraries")
target_link_libraries(SoomlaCocos2dxCore jansson)

set( ${PROJECT_NAME}_INCLUDE_DIRS ${${PROJECT_NAME}_INCLUDE_DIRS}
	CACHE PATH "Headers Directories"
)


