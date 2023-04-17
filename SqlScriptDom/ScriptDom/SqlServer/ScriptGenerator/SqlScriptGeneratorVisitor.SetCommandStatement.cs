//------------------------------------------------------------------------------
// <copyright file="SqlScriptGeneratorVisitor.SetCommandStatement.cs" company="Microsoft">
//         Copyright (c) Microsoft Corporation.  All rights reserved.
// </copyright>
//------------------------------------------------------------------------------
using Microsoft.SqlServer.TransactSql.ScriptDom;

namespace Microsoft.SqlServer.TransactSql.ScriptDom.ScriptGenerator
{
    partial class SqlScriptGeneratorVisitor
    {
        public override void ExplicitVisit(SetCommandStatement node)
        {
            GenerateKeyword(TSqlTokenType.Set);

            GenerateSpace();
            // could be
            //      GeneralSetCommand
            //      SetFipsFlaggerCommand
            GenerateCommaSeparatedList(node.Commands);
        }
    }
}
