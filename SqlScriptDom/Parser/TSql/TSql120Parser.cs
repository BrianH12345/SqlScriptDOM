//------------------------------------------------------------------------------
// <copyright file="TSql120Parser.cs" company="Microsoft">
//         Copyright (c) Microsoft Corporation.  All rights reserved.
// </copyright>
//------------------------------------------------------------------------------

using System;
using System.Collections.Generic;
using System.IO;

namespace Microsoft.SqlServer.TransactSql.ScriptDom
{
    /// <summary>
    /// The TSql Parser for 12.0.
    /// </summary>
    [Serializable]
    public class TSql120Parser : TSqlParser
    {
        /// <summary>
        /// Initializes a new instance of the <see cref="TSql120Parser"/> class.
        /// </summary>
        /// <param name="initialQuotedIdentifiers">if set to <c>true</c> [initial quoted identifiers].</param>
        public TSql120Parser(bool initialQuotedIdentifiers)
            : base(initialQuotedIdentifiers)
        {
        }

        internal override TSqlLexerBaseInternal GetNewInternalLexer()
        {
            return new TSql120LexerInternal();
        }

        #region Some utility stuff
        TSql120ParserInternal GetNewInternalParser()
        {
            return new TSql120ParserInternal(QuotedIdentifier);
        }

        TSql120ParserInternal GetNewInternalParserForInput(TextReader input, out IList<ParseError> errors, 
            int startOffset, int startLine, int startColumn)
        {
            TSql120ParserInternal parser = GetNewInternalParser();
            InitializeInternalParserInput(parser, input, out errors, startOffset, startLine, startColumn);
            return parser;
        }
        #endregion

        /// <summary>
        /// The blocking parse method.
        /// </summary>
        /// <param name="tokens">The list of tokens that will be parsed.</param>
        /// <param name="errors">The parse errors.</param>
        /// <returns>The fragment that is created.</returns>        
        public override TSqlFragment Parse(IList<TSqlParserToken> tokens, out IList<ParseError> errors)
        {
            errors = new List<ParseError>();
            TSql120ParserInternal parser = GetNewInternalParser();
            parser.InitializeForNewInput(tokens, errors, false);
            return parser.ParseRuleWithStandardExceptionHandling<TSqlScript>(parser.script, ScriptEntryMethod);
        }

        /// <summary>
        /// Parses an input string to get a ChildObjectName.  This will return null, if there were any errors.
        /// </summary>
        public override ChildObjectName ParseChildObjectName(TextReader input, out IList<ParseError> errors, int startOffset, int startLine, int startColumn)
        {
            TSql120ParserInternal parser = GetNewInternalParserForInput(input, out errors, startOffset, startLine, startColumn);
            return parser.ParseRuleWithStandardExceptionHandling<ChildObjectName>(parser.entryPointChildObjectName, "entryPointChildObjectName");
        }

        /// <summary>
        /// Parses an input string to get a SchemaObjectName.  This will return null, if there were any errors.
        /// </summary>
        public override SchemaObjectName ParseSchemaObjectName(TextReader input, out IList<ParseError> errors, int startOffset, int startLine, int startColumn)
        {
            TSql120ParserInternal parser = GetNewInternalParserForInput(input, out errors, startOffset, startLine, startColumn);
            return parser.ParseRuleWithStandardExceptionHandling<SchemaObjectName>(parser.entryPointSchemaObjectName, "entryPointSchemaObjectName");
        }

        /// <summary>
        /// Parses an input string to get a data type. This will return null, if there were any errors.
        /// </summary>
        public override DataTypeReference ParseScalarDataType(TextReader input, out IList<ParseError> errors, int startOffset, int startLine, int startColumn)
        {
            TSql120ParserInternal parser = GetNewInternalParserForInput(input, out errors, startOffset, startLine, startColumn);
            return parser.ParseRuleWithStandardExceptionHandling<DataTypeReference>(parser.entryPointScalarDataType, "entryPointScalarDataType");
        }

        /// <summary>
        /// Parses an input string to get an expression. This will return null, if there were any errors.
        /// </summary>
        public override ScalarExpression ParseExpression(TextReader input, out IList<ParseError> errors, int startOffset, int startLine, int startColumn)
        {
            TSql120ParserInternal parser = GetNewInternalParserForInput(input, out errors, startOffset, startLine, startColumn);
            return parser.ParseRuleWithStandardExceptionHandling<ScalarExpression>(parser.entryPointExpression, "entryPointExpression");
        }

        /// <summary>
        /// Parses an input string to get a boolean expression. This will return null, if there were any errors.
        /// </summary>
        public override BooleanExpression ParseBooleanExpression(TextReader input, out IList<ParseError> errors, int startOffset, int startLine, int startColumn)
        {
            TSql120ParserInternal parser = GetNewInternalParserForInput(input, out errors, startOffset, startLine, startColumn);
            return parser.ParseRuleWithStandardExceptionHandling<BooleanExpression>(parser.entryPointBooleanExpression, "entryPointBooleanExpression");
        }

        /// <summary>
        /// Parses an input string to get a statement list. This will return null, if there were any errors.
        /// </summary>
        public override StatementList ParseStatementList(TextReader input, out IList<ParseError> errors, int startOffset, int startLine, int startColumn)
        {
            TSql120ParserInternal parser = GetNewInternalParserForInput(input, out errors, startOffset, startLine, startColumn);
            return parser.ParseRuleWithStandardExceptionHandling<StatementList>(parser.entryPointStatementList, "entryPointStatementList");
        }

        /// <summary>
        /// Parses an input string to get a subquery expression with optional common table expression
        /// and xml namespaces. This will return null, if there were any errors.
        /// </summary>
        public override SelectStatement ParseSubQueryExpressionWithOptionalCTE(TextReader input, out IList<ParseError> errors, int startOffset, int startLine, int startColumn)
        {
            TSql120ParserInternal parser = GetNewInternalParserForInput(input, out errors, startOffset, startLine, startColumn);
            return parser.ParseRuleWithStandardExceptionHandling<SelectStatement>(parser.entryPointSubqueryExpressionWithOptionalCTE, "entryPointSubqueryExpressionWithOptionalCTE");
        }

        /// <summary>
        /// Parses an input string to get an IP v4 address. This will return null, if there were any errors.
        /// </summary>
        internal IPv4 ParseIPv4(TextReader input, out IList<ParseError> errors, int startOffset, int startLine, int startColumn)
        {
            TSql120ParserInternal parser = GetNewInternalParserForInput(input, out errors, startOffset, startLine, startColumn);
            return parser.ParseRuleWithStandardExceptionHandling<IPv4>(parser.entryPointIPv4Address, "entryPointIPv4Address");
        }

        /// <summary>
        /// Parses an input string to get a constant or identifier. This will return null, if there were any errors.
        /// </summary>
        public override TSqlFragment ParseConstantOrIdentifier(TextReader input, out IList<ParseError> errors, int startOffset, int startLine, int startColumn)
        {
            TSql120ParserInternal parser = GetNewInternalParserForInput(input, out errors, startOffset, startLine, startColumn);
            return parser.ParseRuleWithStandardExceptionHandling<TSqlFragment>(parser.entryPointConstantOrIdentifier, "entryPointConstantOrIdentifier");
        }

        /// <summary>
        /// Parses an input string to get a constant or identifier or default literal(literal with value "DEFAULT"). This will return null, if there were any errors.
        /// </summary>
        public override TSqlFragment ParseConstantOrIdentifierWithDefault(TextReader input, out IList<ParseError> errors, int startOffset, int startLine, int startColumn)
        {
            TSql120ParserInternal parser = GetNewInternalParserForInput(input, out errors, startOffset, startLine, startColumn);
            return parser.ParseRuleWithStandardExceptionHandling<TSqlFragment>(parser.entryPointConstantOrIdentifierWithDefault, "entryPointConstantOrIdentifierWithDefault");
        }

        internal override TSqlStatement PhaseOneParse(TextReader input)
        {
            TSql120ParserInternal parser = GetNewInternalParser();
            return PhaseOneParseImpl(parser, parser.script, ScriptEntryMethod, input);
        }
    }
}
