// This defines the API exposed by the Python extension module.
//
// Copyright (c) 2023 Riverbank Computing Limited <info@riverbankcomputing.com>
// 
// This file is part of PyQt5.
// 
// This file may be used under the terms of the GNU General Public License
// version 3.0 as published by the Free Software Foundation and appearing in
// the file LICENSE included in the packaging of this file.  Please review the
// following information to ensure the GNU General Public License version 3.0
// requirements will be met: http://www.gnu.org/copyleft/gpl.html.
// 
// If you do not wish to use this file under the terms of the GPL version 3.0
// then you may purchase a commercial license.  For more information contact
// info@riverbankcomputing.com.
// 
// This file is provided AS IS with NO WARRANTY OF ANY KIND, INCLUDING THE
// WARRANTY OF DESIGN, MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.


%Module(name=PyQt5.pylupdate, keyword_arguments="None", use_limited_api=True)

%Import QtCore/QtCoremod.sip

%Copying
Copyright (c) 2023 Riverbank Computing Limited <info@riverbankcomputing.com>

This file is part of PyQt5.

This file may be used under the terms of the GNU General Public License
version 3.0 as published by the Free Software Foundation and appearing in
the file LICENSE included in the packaging of this file.  Please review the
following information to ensure the GNU General Public License version 3.0
requirements will be met: http://www.gnu.org/copyleft/gpl.html.

If you do not wish to use this file under the terms of the GPL version 3.0
then you may purchase a commercial license.  For more information contact
info@riverbankcomputing.com.

This file is provided AS IS with NO WARRANTY OF ANY KIND, INCLUDING THE
WARRANTY OF DESIGN, MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.
%End

%DefaultSupertype sip.simplewrapper
%DefaultEncoding "Latin-1"


%ModuleHeaderCode
#include "pylupdate.h"
%End


void fetchtr_py(const char *fileName /Encoding="None"/, MetaTranslator *tor,
        const char *defaultContext, bool mustExist, const char *codecForSource,
        const char *tr_func, const char *translate_func);

void fetchtr_ui(const char *fileName /Encoding="None"/, MetaTranslator *tor,
        const char *defaultContext, bool mustExist);

void merge(const MetaTranslator *tor, const MetaTranslator *virginTor,
        MetaTranslator *out, bool noObsolete, bool verbose,
        const QString &filename);

QMap<QString, QString> proFileTagMap(const QString &text);


class MetaTranslator
{
%TypeHeaderCode
#include "pylupdate.h"
%End

public:
    MetaTranslator();
    MetaTranslator(const MetaTranslator &tor);

    bool load(const QString &filename);
    bool save(const QString &filename) const;
    void stripObsoleteMessages();
    void stripEmptyContexts();
    void setCodec(const char *name);
};
