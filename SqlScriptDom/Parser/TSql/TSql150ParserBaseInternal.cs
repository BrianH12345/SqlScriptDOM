﻿//------------------------------------------------------------------------------
// <copyright file="TSql150ParserBaseInternals.cs" company="Microsoft">
//         Copyright (c) Microsoft Corporation.  All rights reserved.
// </copyright>
//------------------------------------------------------------------------------

using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Globalization;
using System.Text.RegularExpressions;
using antlr;

namespace Microsoft.SqlServer.TransactSql.ScriptDom
{
    internal abstract class TSql150ParserBaseInternal : TSql140ParserBaseInternal
    {
        #region Constructors

        // Not really needed, here only because ANTLR generates call to this one in derived classes
        protected TSql150ParserBaseInternal(TokenBuffer tokenBuf, int k)
            : base(tokenBuf, k)
        {
        }

        // Not really needed, here only because ANTLR generates call to this one in derived classes
        protected TSql150ParserBaseInternal(ParserSharedInputState state, int k)
            : base(state, k)
        {
        }

        // Not really needed, here only because ANTLR generates call to this one in derived classes
        protected TSql150ParserBaseInternal(TokenStream lexer, int k)
            : base(lexer, k)
        {
        }

        /// <summary>
        /// Real constructor (the one which is used)
        /// </summary>
        /// <param name="initialQuotedIdentifiersOn">if set to <c>true</c> initial quoted identifiers will be set to on.</param>
        public TSql150ParserBaseInternal(bool initialQuotedIdentifiersOn)
            : base(initialQuotedIdentifiersOn)
        {
        }

        #endregion

        protected static void VerifyAllowedIndexOption150(IndexAffectingStatement statement, IndexOption option)
        {
            VerifyAllowedIndexOption(statement, option, SqlVersionFlags.TSql150);
            VerifyAllowedOnlineIndexOptionLowPriorityLockWait(statement, option);
        }

        protected static void VerifyAllowedOnlineIndexOptionLowPriorityLockWait(IndexAffectingStatement statement, IndexOption option)
        {
            // for a low priority lock wait (MLP) option, check if it is allowed for the statement.
            //
            if (option is OnlineIndexOption)
            {
                OnlineIndexOption onlineIndexOption = option as OnlineIndexOption;
                if (onlineIndexOption.LowPriorityLockWaitOption != null)
                {
                    switch (statement)
                    {
                        case IndexAffectingStatement.AlterIndexRebuildOnePartition:
                        case IndexAffectingStatement.AlterTableRebuildOnePartition:
                        case IndexAffectingStatement.AlterIndexRebuildAllPartitions:
                        case IndexAffectingStatement.AlterTableRebuildAllPartitions:
                            // allowed
                            //
                            break;

                        default:
                            // WAIT_AT_LOW_PRIORITY is not a valid index option in the statement
                            //
                            ThrowWrongIndexOptionError(statement, onlineIndexOption.LowPriorityLockWaitOption);
                            break;
                    }
                }
            }
        }
    }
}
