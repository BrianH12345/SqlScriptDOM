﻿//------------------------------------------------------------------------------
// <copyright file="SqlScriptGeneratorVisitor.ExternalFileFormatStatementOptions.cs" company="Microsoft">
//         Copyright (c) Microsoft Corporation.  All rights reserved.
// </copyright>
//------------------------------------------------------------------------------
using Microsoft.SqlServer.TransactSql.ScriptDom;

namespace Microsoft.SqlServer.TransactSql.ScriptDom.ScriptGenerator
{
    partial class SqlScriptGeneratorVisitor
    {
        public override void ExplicitVisit(ExternalFileFormatLiteralOption node)
        {
            ExternalFileFormatOptionHelper.Instance.GenerateSourceForOption(_writer, node.OptionKind);
            GenerateSpaceAndSymbol(TSqlTokenType.EqualsSign);
            GenerateSpaceAndFragmentIfNotNull(node.Value);
        }
    }
}