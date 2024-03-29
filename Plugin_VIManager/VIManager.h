/* ----------------------------------------------------------------- */
/*           The Toolkit for Building Voice Interaction Systems      */
/*           "MMDAgent" developed by MMDAgent Project Team           */
/*           http://www.mmdagent.jp/                                 */
/* ----------------------------------------------------------------- */
/*                                                                   */
/*  Copyright (c) 2009-2016  Nagoya Institute of Technology          */
/*                           Department of Computer Science          */
/*                                                                   */
/* All rights reserved.                                              */
/*                                                                   */
/* Redistribution and use in source and binary forms, with or        */
/* without modification, are permitted provided that the following   */
/* conditions are met:                                               */
/*                                                                   */
/* - Redistributions of source code must retain the above copyright  */
/*   notice, this list of conditions and the following disclaimer.   */
/* - Redistributions in binary form must reproduce the above         */
/*   copyright notice, this list of conditions and the following     */
/*   disclaimer in the documentation and/or other materials provided */
/*   with the distribution.                                          */
/* - Neither the name of the MMDAgent project team nor the names of  */
/*   its contributors may be used to endorse or promote products     */
/*   derived from this software without specific prior written       */
/*   permission.                                                     */
/*                                                                   */
/* THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND            */
/* CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES,       */
/* INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF          */
/* MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE          */
/* DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS */
/* BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,          */
/* EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED   */
/* TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,     */
/* DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON */
/* ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,   */
/* OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY    */
/* OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE           */
/* POSSIBILITY OF SUCH DAMAGE.                                       */
/* ----------------------------------------------------------------- */

/* definitions */

#define VIMANAGER_SEPARATOR1 '|'
#define VIMANAGER_SEPARATOR2 ','
#define VIMANAGER_COMMENT    '#'
#define VIMANAGER_STARTSTATE 0
#define VIMANAGER_EPSILON    "<eps>"
#define VIMANAGER_REGEXP_BRACE '@'

/* InputArguments: input for state transition */
typedef struct _InputArguments {
   int size;
   char ***args;
   int *argc;
   char *str;
} InputArguments;

/* InputArguments_initialize: initialize input */
void InputArguments_initialize(InputArguments *ia, const char *str);

/* InputArguments_clear: free input */
void InputArguments_clear(InputArguments *ia);

/* VIManager_Arc: arc */
typedef struct _VIManager_Arc {
   char *input_event_type;
   InputArguments input_event_args;
   char *output_command_type;
   char *output_command_args;
   char *variable_action;
   struct _VIManager_State *next_state;
   struct _VIManager_Arc *next;
} VIManager_Arc;

/* VIManager_ALis: arc list */
typedef struct _VIManager_AList {
   VIManager_Arc *head;
} VIManager_AList;

/* VIManager_State: state */
typedef struct _VIManager_State {
   unsigned int number;
   struct _VIManager_AList arc_list;
   struct _VIManager_State *next;
} VIManager_State;

/* VIManager_SList: state list */
typedef struct _VIManager_SList {
   VIManager_State *head;
} VIManager_SList;

/* VIManager_Variable: variable */
typedef struct _VIManager_Variable {
   char *name;
   char *value;
   struct _VIManager_Variable *next;
} VIManager_Variable;

/* VIManager_VList: variable list */
typedef struct _VIManager_VList {
   VIManager_Variable *head;
} VIManager_VList;

/* VIManager: Voice Interaction Manager */
class VIManager
{
private:

   VIManager_SList m_stateList;     /* state list */
   VIManager_State *m_currentState; /* pointer to current state */
   VIManager_VList m_variableList;  /* variable list */

   /* initialize: initialize VIManager */
   void initialize();

   /* clear: free VIManager */
   void clear();

   /* substituteVariableAndCopy: substitute variables with their values in a string */
   void substituteVariableAndCopy(const char *input, char *output);

   /* checkStringMatch: check if vstr with variables matches the string */
   bool checkStringMatch(const char *vstr, const char *str);

   /* checkStringMatchRegExp: check if vstr with variables matches the string as regular expression */
   bool checkStringMatchRegExp(const char *vstr, const char *str1, const char *str2);

   /* checkArcMatch: check if an arc matches an input */
   bool checkArcMatch(const char *arc_type, const char *input_type, const InputArguments *arc_arg, const InputArguments *input_arg);

   /* assignVariableByEquation: assign variable by equation */
   bool assignVariableByEquation(const char *va);

public:

   /* VIManager: constructor */
   VIManager();

   /* ~VIManager: destructor */
   ~VIManager();

   /* load: load FST */
   bool load(const char *file);

   /* transition: state transition (if jumped, return arc) */
   VIManager_Arc *transition(const char *itype, const InputArguments *iargs, char *otype, char *oargs);

   /* getCurrentState: get current state */
   VIManager_State *getCurrentState();

   /* getCurrentVariableList: get current variable list */
   VIManager_VList *getCurrentVariableList();
};
