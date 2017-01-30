# 
# Uli Meis <a.sporto+bee@gmail.com>
#
# Mostly taken from cmake findcurl, version stuff from kopete
#
# - Find libotr
# Find the libotr headers and library.
#
#  LIBOTR_INCLUDE_DIR
#  LIBOTR_LIBRARIES
#  LIBOTR_FOUND

# Look for the header file.
FIND_PATH(LIBOTR_INCLUDE_DIR NAMES libotr/version.h)
MARK_AS_ADVANCED(LIBOTR_INCLUDE_DIR)

# Look for the library.
FIND_LIBRARY(LIBOTR_LIBRARY NAMES otr)
MARK_AS_ADVANCED(LIBOTR_LIBRARY)

# Copy the results to the output variables.
IF(LIBOTR_INCLUDE_DIR AND LIBOTR_LIBRARY)
  SET(LIBOTR_FOUND 1)
  SET(LIBOTR_LIBRARIES ${LIBOTR_LIBRARY})
  SET(LIBOTR_INCLUDE_DIRS ${LIBOTR_INCLUDE_DIR})
  EXECUTE_PROCESS(COMMAND grep "OTRL_VERSION" 
    "${LIBOTR_INCLUDE_DIR}/libotr/version.h" OUTPUT_VARIABLE output)
  STRING(REGEX MATCH "OTRL_VERSION \"[0-9]+\\.[0-9]+\\.[0-9]+" 
    LIBOTR_VERSION "${output}")
  STRING(REGEX REPLACE "^OTRL_VERSION \"" "" LIBOTR_VERSION "${LIBOTR_VERSION}")
  MESSAGE(STATUS "  found libotr, version ${LIBOTR_VERSION}" )
ELSE(LIBOTR_INCLUDE_DIR AND LIBOTR_LIBRARY)
  SET(LIBOTR_FOUND 0)
  SET(LIBOTR_LIBRARIES)
  SET(LIBOTR_INCLUDE_DIRS)
ENDIF(LIBOTR_INCLUDE_DIR AND LIBOTR_LIBRARY)

# Report the results.
IF(NOT LIBOTR_FOUND)
  SET(LIBOTR_DIR_MESSAGE
    "LIBOTR was not found. Make sure LIBOTR_LIBRARY and LIBOTR_INCLUDE_DIR are set.")
  IF(NOT LIBOTR_FIND_QUIETLY)
    MESSAGE(STATUS "${LIBOTR_DIR_MESSAGE}")
  ELSE(NOT LIBOTR_FIND_QUIETLY)
    IF(LIBOTR_FIND_REQUIRED)
      MESSAGE(FATAL_ERROR "${LIBOTR_DIR_MESSAGE}")
    ENDIF(LIBOTR_FIND_REQUIRED)
  ENDIF(NOT LIBOTR_FIND_QUIETLY)
ENDIF(NOT LIBOTR_FOUND)