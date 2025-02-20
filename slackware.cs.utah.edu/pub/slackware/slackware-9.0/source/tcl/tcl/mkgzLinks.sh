#!/bin/sh
# This script is invoked when installing manual entries.  It generates
# additional links to manual entries, corresponding to the procedure
# and command names described by the manual entry.  For example, the
# Tcl manual entry Hash.3.gz describes procedures Tcl_InitHashTable,
# Tcl_CreateHashEntry, and many more.  This script will make hard
# links so that Tcl_InitHashTable.3.gz, Tcl_CreateHashEntry.3.gz, and so
# on all refer to Hash.3.gz in the installed directory.
#
# Because of the length of command and procedure names, this mechanism
# only works on machines that support file names longer than 14 characters.
# This script checks to see if long file names are supported, and it
# doesn't make any links if they are not.
#
# The script takes one argument, which is the name of the directory
# where the manual entries have been installed.

ZIP=true
while true; do
    case $1 in
        -s | --symlinks )
            S=-s
            ;;
        -z | --compress )
            ZIP=$2
            shift
            ;;
        *) break
            ;;
    esac
    shift
done

if test $# != 1; then
    echo "Usage: mkLinks <options> dir"
    exit 1
fi

if test "x$ZIP" != "xtrue"; then
    touch TeST
    $ZIP TeST
    Z=`ls TeST* | sed 's/^[^.]*//'`
    rm -f TeST*
fi

cd $1
echo foo > xyzzyTestingAVeryLongFileName.foo
x=`echo xyzzyTe*`
echo foo > xyzzyTestingaverylongfilename.foo
y=`echo xyzzyTestingav*`
rm xyzzyTe*
if test "$x" != "xyzzyTestingAVeryLongFileName.foo"; then
    exit
fi
if test "$y" != "xyzzyTestingaverylongfilename.foo"; then
    CASEINSENSITIVEFS=1
fi

if test -r Access.3.gz; then
    rm -f Access.3.gz.*
    $ZIP Access.3.gz
    rm -f Tcl_Access.3.gz Tcl_Access.3.gz.* 
    rm -f Tcl_Stat.3.gz Tcl_Stat.3.gz.* 
    ln -sf $S Access.3.gz$Z Tcl_Access.3.gz$Z 
    ln -sf $S Access.3.gz$Z Tcl_Stat.3.gz$Z 
fi
if test -r AddErrInfo.3.gz; then
    rm -f AddErrInfo.3.gz.*
    $ZIP AddErrInfo.3.gz
    rm -f Tcl_AddObjErrorInfo.3.gz Tcl_AddObjErrorInfo.3.gz.* 
    rm -f Tcl_AddErrorInfo.3.gz Tcl_AddErrorInfo.3.gz.* 
    rm -f Tcl_SetObjErrorCode.3.gz Tcl_SetObjErrorCode.3.gz.* 
    rm -f Tcl_SetErrorCode.3.gz Tcl_SetErrorCode.3.gz.* 
    rm -f Tcl_SetErrorCodeVA.3.gz Tcl_SetErrorCodeVA.3.gz.* 
    rm -f Tcl_PosixError.3.gz Tcl_PosixError.3.gz.* 
    rm -f Tcl_LogCommandInfo.3.gz Tcl_LogCommandInfo.3.gz.* 
    ln -sf $S AddErrInfo.3.gz$Z Tcl_AddObjErrorInfo.3.gz$Z 
    ln -sf $S AddErrInfo.3.gz$Z Tcl_AddErrorInfo.3.gz$Z 
    ln -sf $S AddErrInfo.3.gz$Z Tcl_SetObjErrorCode.3.gz$Z 
    ln -sf $S AddErrInfo.3.gz$Z Tcl_SetErrorCode.3.gz$Z 
    ln -sf $S AddErrInfo.3.gz$Z Tcl_SetErrorCodeVA.3.gz$Z 
    ln -sf $S AddErrInfo.3.gz$Z Tcl_PosixError.3.gz$Z 
    ln -sf $S AddErrInfo.3.gz$Z Tcl_LogCommandInfo.3.gz$Z 
fi
if test -r Alloc.3.gz; then
    rm -f Alloc.3.gz.*
    $ZIP Alloc.3.gz
    rm -f Tcl_Alloc.3.gz Tcl_Alloc.3.gz.* 
    rm -f Tcl_Free.3.gz Tcl_Free.3.gz.* 
    rm -f Tcl_Realloc.3.gz Tcl_Realloc.3.gz.* 
    rm -f Tcl_AttemptAlloc.3.gz Tcl_AttemptAlloc.3.gz.* 
    rm -f Tcl_AttemptRealloc.3.gz Tcl_AttemptRealloc.3.gz.* 
    rm -f ckalloc.3.gz ckalloc.3.gz.* 
    rm -f ckfree.3.gz ckfree.3.gz.* 
    rm -f ckrealloc.3.gz ckrealloc.3.gz.* 
    rm -f attemptckalloc.3.gz attemptckalloc.3.gz.* 
    rm -f attemptckrealloc.3.gz attemptckrealloc.3.gz.* 
    ln -sf $S Alloc.3.gz$Z Tcl_Alloc.3.gz$Z 
    ln -sf $S Alloc.3.gz$Z Tcl_Free.3.gz$Z 
    ln -sf $S Alloc.3.gz$Z Tcl_Realloc.3.gz$Z 
    ln -sf $S Alloc.3.gz$Z Tcl_AttemptAlloc.3.gz$Z 
    ln -sf $S Alloc.3.gz$Z Tcl_AttemptRealloc.3.gz$Z 
    ln -sf $S Alloc.3.gz$Z ckalloc.3.gz$Z 
    ln -sf $S Alloc.3.gz$Z ckfree.3.gz$Z 
    ln -sf $S Alloc.3.gz$Z ckrealloc.3.gz$Z 
    ln -sf $S Alloc.3.gz$Z attemptckalloc.3.gz$Z 
    ln -sf $S Alloc.3.gz$Z attemptckrealloc.3.gz$Z 
fi
if test -r AllowExc.3.gz; then
    rm -f AllowExc.3.gz.*
    $ZIP AllowExc.3.gz
    rm -f Tcl_AllowExceptions.3.gz Tcl_AllowExceptions.3.gz.* 
    ln -sf $S AllowExc.3.gz$Z Tcl_AllowExceptions.3.gz$Z 
fi
if test -r AppInit.3.gz; then
    rm -f AppInit.3.gz.*
    $ZIP AppInit.3.gz
    rm -f Tcl_AppInit.3.gz Tcl_AppInit.3.gz.* 
    ln -sf $S AppInit.3.gz$Z Tcl_AppInit.3.gz$Z 
fi
if test -r AssocData.3.gz; then
    rm -f AssocData.3.gz.*
    $ZIP AssocData.3.gz
    rm -f Tcl_GetAssocData.3.gz Tcl_GetAssocData.3.gz.* 
    rm -f Tcl_SetAssocData.3.gz Tcl_SetAssocData.3.gz.* 
    rm -f Tcl_DeleteAssocData.3.gz Tcl_DeleteAssocData.3.gz.* 
    ln -sf $S AssocData.3.gz$Z Tcl_GetAssocData.3.gz$Z 
    ln -sf $S AssocData.3.gz$Z Tcl_SetAssocData.3.gz$Z 
    ln -sf $S AssocData.3.gz$Z Tcl_DeleteAssocData.3.gz$Z 
fi
if test -r Async.3.gz; then
    rm -f Async.3.gz.*
    $ZIP Async.3.gz
    rm -f Tcl_AsyncCreate.3.gz Tcl_AsyncCreate.3.gz.* 
    rm -f Tcl_AsyncMark.3.gz Tcl_AsyncMark.3.gz.* 
    rm -f Tcl_AsyncInvoke.3.gz Tcl_AsyncInvoke.3.gz.* 
    rm -f Tcl_AsyncDelete.3.gz Tcl_AsyncDelete.3.gz.* 
    rm -f Tcl_AsyncReady.3.gz Tcl_AsyncReady.3.gz.* 
    ln -sf $S Async.3.gz$Z Tcl_AsyncCreate.3.gz$Z 
    ln -sf $S Async.3.gz$Z Tcl_AsyncMark.3.gz$Z 
    ln -sf $S Async.3.gz$Z Tcl_AsyncInvoke.3.gz$Z 
    ln -sf $S Async.3.gz$Z Tcl_AsyncDelete.3.gz$Z 
    ln -sf $S Async.3.gz$Z Tcl_AsyncReady.3.gz$Z 
fi
if test -r BackgdErr.3.gz; then
    rm -f BackgdErr.3.gz.*
    $ZIP BackgdErr.3.gz
    rm -f Tcl_BackgroundError.3.gz Tcl_BackgroundError.3.gz.* 
    ln -sf $S BackgdErr.3.gz$Z Tcl_BackgroundError.3.gz$Z 
fi
if test -r Backslash.3.gz; then
    rm -f Backslash.3.gz.*
    $ZIP Backslash.3.gz
    rm -f Tcl_Backslash.3.gz Tcl_Backslash.3.gz.* 
    ln -sf $S Backslash.3.gz$Z Tcl_Backslash.3.gz$Z 
fi
if test -r BoolObj.3.gz; then
    rm -f BoolObj.3.gz.*
    $ZIP BoolObj.3.gz
    rm -f Tcl_NewBooleanObj.3.gz Tcl_NewBooleanObj.3.gz.* 
    rm -f Tcl_SetBooleanObj.3.gz Tcl_SetBooleanObj.3.gz.* 
    rm -f Tcl_GetBooleanFromObj.3.gz Tcl_GetBooleanFromObj.3.gz.* 
    ln -sf $S BoolObj.3.gz$Z Tcl_NewBooleanObj.3.gz$Z 
    ln -sf $S BoolObj.3.gz$Z Tcl_SetBooleanObj.3.gz$Z 
    ln -sf $S BoolObj.3.gz$Z Tcl_GetBooleanFromObj.3.gz$Z 
fi
if test -r ByteArrObj.3.gz; then
    rm -f ByteArrObj.3.gz.*
    $ZIP ByteArrObj.3.gz
    rm -f Tcl_NewByteArrayObj.3.gz Tcl_NewByteArrayObj.3.gz.* 
    rm -f Tcl_SetByteArrayObj.3.gz Tcl_SetByteArrayObj.3.gz.* 
    rm -f Tcl_GetByteArrayFromObj.3.gz Tcl_GetByteArrayFromObj.3.gz.* 
    rm -f Tcl_SetByteArrayLength.3.gz Tcl_SetByteArrayLength.3.gz.* 
    ln -sf $S ByteArrObj.3.gz$Z Tcl_NewByteArrayObj.3.gz$Z 
    ln -sf $S ByteArrObj.3.gz$Z Tcl_SetByteArrayObj.3.gz$Z 
    ln -sf $S ByteArrObj.3.gz$Z Tcl_GetByteArrayFromObj.3.gz$Z 
    ln -sf $S ByteArrObj.3.gz$Z Tcl_SetByteArrayLength.3.gz$Z 
fi
if test -r CallDel.3.gz; then
    rm -f CallDel.3.gz.*
    $ZIP CallDel.3.gz
    rm -f Tcl_CallWhenDeleted.3.gz Tcl_CallWhenDeleted.3.gz.* 
    rm -f Tcl_DontCallWhenDeleted.3.gz Tcl_DontCallWhenDeleted.3.gz.* 
    ln -sf $S CallDel.3.gz$Z Tcl_CallWhenDeleted.3.gz$Z 
    ln -sf $S CallDel.3.gz$Z Tcl_DontCallWhenDeleted.3.gz$Z 
fi
if test -r ChnlStack.3.gz; then
    rm -f ChnlStack.3.gz.*
    $ZIP ChnlStack.3.gz
    rm -f Tcl_StackChannel.3.gz Tcl_StackChannel.3.gz.* 
    rm -f Tcl_UnstackChannel.3.gz Tcl_UnstackChannel.3.gz.* 
    rm -f Tcl_GetStackedChannel.3.gz Tcl_GetStackedChannel.3.gz.* 
    rm -f Tcl_GetTopChannel.3.gz Tcl_GetTopChannel.3.gz.* 
    ln -sf $S ChnlStack.3.gz$Z Tcl_StackChannel.3.gz$Z 
    ln -sf $S ChnlStack.3.gz$Z Tcl_UnstackChannel.3.gz$Z 
    ln -sf $S ChnlStack.3.gz$Z Tcl_GetStackedChannel.3.gz$Z 
    ln -sf $S ChnlStack.3.gz$Z Tcl_GetTopChannel.3.gz$Z 
fi
if test -r CmdCmplt.3.gz; then
    rm -f CmdCmplt.3.gz.*
    $ZIP CmdCmplt.3.gz
    rm -f Tcl_CommandComplete.3.gz Tcl_CommandComplete.3.gz.* 
    ln -sf $S CmdCmplt.3.gz$Z Tcl_CommandComplete.3.gz$Z 
fi
if test -r Concat.3.gz; then
    rm -f Concat.3.gz.*
    $ZIP Concat.3.gz
    rm -f Tcl_Concat.3.gz Tcl_Concat.3.gz.* 
    ln -sf $S Concat.3.gz$Z Tcl_Concat.3.gz$Z 
fi
if test -r CrtChannel.3.gz; then
    rm -f CrtChannel.3.gz.*
    $ZIP CrtChannel.3.gz
    rm -f Tcl_CreateChannel.3.gz Tcl_CreateChannel.3.gz.* 
    rm -f Tcl_GetChannelInstanceData.3.gz Tcl_GetChannelInstanceData.3.gz.* 
    rm -f Tcl_GetChannelType.3.gz Tcl_GetChannelType.3.gz.* 
    rm -f Tcl_GetChannelName.3.gz Tcl_GetChannelName.3.gz.* 
    rm -f Tcl_GetChannelHandle.3.gz Tcl_GetChannelHandle.3.gz.* 
    rm -f Tcl_GetChannelMode.3.gz Tcl_GetChannelMode.3.gz.* 
    rm -f Tcl_GetChannelBufferSize.3.gz Tcl_GetChannelBufferSize.3.gz.* 
    rm -f Tcl_SetChannelBufferSize.3.gz Tcl_SetChannelBufferSize.3.gz.* 
    rm -f Tcl_NotifyChannel.3.gz Tcl_NotifyChannel.3.gz.* 
    rm -f Tcl_BadChannelOption.3.gz Tcl_BadChannelOption.3.gz.* 
    rm -f Tcl_ChannelName.3.gz Tcl_ChannelName.3.gz.* 
    rm -f Tcl_ChannelVersion.3.gz Tcl_ChannelVersion.3.gz.* 
    rm -f Tcl_ChannelBlockModeProc.3.gz Tcl_ChannelBlockModeProc.3.gz.* 
    rm -f Tcl_ChannelCloseProc.3.gz Tcl_ChannelCloseProc.3.gz.* 
    rm -f Tcl_ChannelClose2Proc.3.gz Tcl_ChannelClose2Proc.3.gz.* 
    rm -f Tcl_ChannelInputProc.3.gz Tcl_ChannelInputProc.3.gz.* 
    rm -f Tcl_ChannelOutputProc.3.gz Tcl_ChannelOutputProc.3.gz.* 
    rm -f Tcl_ChannelSeekProc.3.gz Tcl_ChannelSeekProc.3.gz.* 
    rm -f Tcl_ChannelWideSeekProc.3.gz Tcl_ChannelWideSeekProc.3.gz.* 
    rm -f Tcl_ChannelSetOptionProc.3.gz Tcl_ChannelSetOptionProc.3.gz.* 
    rm -f Tcl_ChannelGetOptionProc.3.gz Tcl_ChannelGetOptionProc.3.gz.* 
    rm -f Tcl_ChannelWatchProc.3.gz Tcl_ChannelWatchProc.3.gz.* 
    rm -f Tcl_ChannelGetHandleProc.3.gz Tcl_ChannelGetHandleProc.3.gz.* 
    rm -f Tcl_ChannelFlushProc.3.gz Tcl_ChannelFlushProc.3.gz.* 
    rm -f Tcl_ChannelHandlerProc.3.gz Tcl_ChannelHandlerProc.3.gz.* 
    rm -f Tcl_IsChannelShared.3.gz Tcl_IsChannelShared.3.gz.* 
    rm -f Tcl_IsChannelRegistered.3.gz Tcl_IsChannelRegistered.3.gz.* 
    rm -f Tcl_CutChannel.3.gz Tcl_CutChannel.3.gz.* 
    rm -f Tcl_SpliceChannel.3.gz Tcl_SpliceChannel.3.gz.* 
    rm -f Tcl_IsChannelExisting.3.gz Tcl_IsChannelExisting.3.gz.* 
    rm -f Tcl_ClearChannelHandlers.3.gz Tcl_ClearChannelHandlers.3.gz.* 
    rm -f Tcl_GetChannelThread.3.gz Tcl_GetChannelThread.3.gz.* 
    rm -f Tcl_ChannelBuffered.3.gz Tcl_ChannelBuffered.3.gz.* 
    ln -sf $S CrtChannel.3.gz$Z Tcl_CreateChannel.3.gz$Z 
    ln -sf $S CrtChannel.3.gz$Z Tcl_GetChannelInstanceData.3.gz$Z 
    ln -sf $S CrtChannel.3.gz$Z Tcl_GetChannelType.3.gz$Z 
    ln -sf $S CrtChannel.3.gz$Z Tcl_GetChannelName.3.gz$Z 
    ln -sf $S CrtChannel.3.gz$Z Tcl_GetChannelHandle.3.gz$Z 
    ln -sf $S CrtChannel.3.gz$Z Tcl_GetChannelMode.3.gz$Z 
    ln -sf $S CrtChannel.3.gz$Z Tcl_GetChannelBufferSize.3.gz$Z 
    ln -sf $S CrtChannel.3.gz$Z Tcl_SetChannelBufferSize.3.gz$Z 
    ln -sf $S CrtChannel.3.gz$Z Tcl_NotifyChannel.3.gz$Z 
    ln -sf $S CrtChannel.3.gz$Z Tcl_BadChannelOption.3.gz$Z 
    ln -sf $S CrtChannel.3.gz$Z Tcl_ChannelName.3.gz$Z 
    ln -sf $S CrtChannel.3.gz$Z Tcl_ChannelVersion.3.gz$Z 
    ln -sf $S CrtChannel.3.gz$Z Tcl_ChannelBlockModeProc.3.gz$Z 
    ln -sf $S CrtChannel.3.gz$Z Tcl_ChannelCloseProc.3.gz$Z 
    ln -sf $S CrtChannel.3.gz$Z Tcl_ChannelClose2Proc.3.gz$Z 
    ln -sf $S CrtChannel.3.gz$Z Tcl_ChannelInputProc.3.gz$Z 
    ln -sf $S CrtChannel.3.gz$Z Tcl_ChannelOutputProc.3.gz$Z 
    ln -sf $S CrtChannel.3.gz$Z Tcl_ChannelSeekProc.3.gz$Z 
    ln -sf $S CrtChannel.3.gz$Z Tcl_ChannelWideSeekProc.3.gz$Z 
    ln -sf $S CrtChannel.3.gz$Z Tcl_ChannelSetOptionProc.3.gz$Z 
    ln -sf $S CrtChannel.3.gz$Z Tcl_ChannelGetOptionProc.3.gz$Z 
    ln -sf $S CrtChannel.3.gz$Z Tcl_ChannelWatchProc.3.gz$Z 
    ln -sf $S CrtChannel.3.gz$Z Tcl_ChannelGetHandleProc.3.gz$Z 
    ln -sf $S CrtChannel.3.gz$Z Tcl_ChannelFlushProc.3.gz$Z 
    ln -sf $S CrtChannel.3.gz$Z Tcl_ChannelHandlerProc.3.gz$Z 
    ln -sf $S CrtChannel.3.gz$Z Tcl_IsChannelShared.3.gz$Z 
    ln -sf $S CrtChannel.3.gz$Z Tcl_IsChannelRegistered.3.gz$Z 
    ln -sf $S CrtChannel.3.gz$Z Tcl_CutChannel.3.gz$Z 
    ln -sf $S CrtChannel.3.gz$Z Tcl_SpliceChannel.3.gz$Z 
    ln -sf $S CrtChannel.3.gz$Z Tcl_IsChannelExisting.3.gz$Z 
    ln -sf $S CrtChannel.3.gz$Z Tcl_ClearChannelHandlers.3.gz$Z 
    ln -sf $S CrtChannel.3.gz$Z Tcl_GetChannelThread.3.gz$Z 
    ln -sf $S CrtChannel.3.gz$Z Tcl_ChannelBuffered.3.gz$Z 
fi
if test -r CrtChnlHdlr.3.gz; then
    rm -f CrtChnlHdlr.3.gz.*
    $ZIP CrtChnlHdlr.3.gz
    rm -f Tcl_CreateChannelHandler.3.gz Tcl_CreateChannelHandler.3.gz.* 
    rm -f Tcl_DeleteChannelHandler.3.gz Tcl_DeleteChannelHandler.3.gz.* 
    ln -sf $S CrtChnlHdlr.3.gz$Z Tcl_CreateChannelHandler.3.gz$Z 
    ln -sf $S CrtChnlHdlr.3.gz$Z Tcl_DeleteChannelHandler.3.gz$Z 
fi
if test -r CrtCloseHdlr.3.gz; then
    rm -f CrtCloseHdlr.3.gz.*
    $ZIP CrtCloseHdlr.3.gz
    rm -f Tcl_CreateCloseHandler.3.gz Tcl_CreateCloseHandler.3.gz.* 
    rm -f Tcl_DeleteCloseHandler.3.gz Tcl_DeleteCloseHandler.3.gz.* 
    ln -sf $S CrtCloseHdlr.3.gz$Z Tcl_CreateCloseHandler.3.gz$Z 
    ln -sf $S CrtCloseHdlr.3.gz$Z Tcl_DeleteCloseHandler.3.gz$Z 
fi
if test -r CrtCommand.3.gz; then
    rm -f CrtCommand.3.gz.*
    $ZIP CrtCommand.3.gz
    rm -f Tcl_CreateCommand.3.gz Tcl_CreateCommand.3.gz.* 
    ln -sf $S CrtCommand.3.gz$Z Tcl_CreateCommand.3.gz$Z 
fi
if test -r CrtFileHdlr.3.gz; then
    rm -f CrtFileHdlr.3.gz.*
    $ZIP CrtFileHdlr.3.gz
    rm -f Tcl_CreateFileHandler.3.gz Tcl_CreateFileHandler.3.gz.* 
    rm -f Tcl_DeleteFileHandler.3.gz Tcl_DeleteFileHandler.3.gz.* 
    ln -sf $S CrtFileHdlr.3.gz$Z Tcl_CreateFileHandler.3.gz$Z 
    ln -sf $S CrtFileHdlr.3.gz$Z Tcl_DeleteFileHandler.3.gz$Z 
fi
if test -r CrtInterp.3.gz; then
    rm -f CrtInterp.3.gz.*
    $ZIP CrtInterp.3.gz
    rm -f Tcl_CreateInterp.3.gz Tcl_CreateInterp.3.gz.* 
    rm -f Tcl_DeleteInterp.3.gz Tcl_DeleteInterp.3.gz.* 
    rm -f Tcl_InterpDeleted.3.gz Tcl_InterpDeleted.3.gz.* 
    ln -sf $S CrtInterp.3.gz$Z Tcl_CreateInterp.3.gz$Z 
    ln -sf $S CrtInterp.3.gz$Z Tcl_DeleteInterp.3.gz$Z 
    ln -sf $S CrtInterp.3.gz$Z Tcl_InterpDeleted.3.gz$Z 
fi
if test -r CrtMathFnc.3.gz; then
    rm -f CrtMathFnc.3.gz.*
    $ZIP CrtMathFnc.3.gz
    rm -f Tcl_CreateMathFunc.3.gz Tcl_CreateMathFunc.3.gz.* 
    rm -f Tcl_GetMathFuncInfo.3.gz Tcl_GetMathFuncInfo.3.gz.* 
    rm -f Tcl_ListMathFuncs.3.gz Tcl_ListMathFuncs.3.gz.* 
    ln -sf $S CrtMathFnc.3.gz$Z Tcl_CreateMathFunc.3.gz$Z 
    ln -sf $S CrtMathFnc.3.gz$Z Tcl_GetMathFuncInfo.3.gz$Z 
    ln -sf $S CrtMathFnc.3.gz$Z Tcl_ListMathFuncs.3.gz$Z 
fi
if test -r CrtObjCmd.3.gz; then
    rm -f CrtObjCmd.3.gz.*
    $ZIP CrtObjCmd.3.gz
    rm -f Tcl_CreateObjCommand.3.gz Tcl_CreateObjCommand.3.gz.* 
    rm -f Tcl_DeleteCommand.3.gz Tcl_DeleteCommand.3.gz.* 
    rm -f Tcl_DeleteCommandFromToken.3.gz Tcl_DeleteCommandFromToken.3.gz.* 
    rm -f Tcl_GetCommandInfo.3.gz Tcl_GetCommandInfo.3.gz.* 
    rm -f Tcl_GetCommandInfoFromToken.3.gz Tcl_GetCommandInfoFromToken.3.gz.* 
    rm -f Tcl_SetCommandInfo.3.gz Tcl_SetCommandInfo.3.gz.* 
    rm -f Tcl_SetCommandInfoFromToken.3.gz Tcl_SetCommandInfoFromToken.3.gz.* 
    rm -f Tcl_GetCommandName.3.gz Tcl_GetCommandName.3.gz.* 
    rm -f Tcl_GetCommandFullName.3.gz Tcl_GetCommandFullName.3.gz.* 
    rm -f Tcl_GetCommandFromObj.3.gz Tcl_GetCommandFromObj.3.gz.* 
    ln -sf $S CrtObjCmd.3.gz$Z Tcl_CreateObjCommand.3.gz$Z 
    ln -sf $S CrtObjCmd.3.gz$Z Tcl_DeleteCommand.3.gz$Z 
    ln -sf $S CrtObjCmd.3.gz$Z Tcl_DeleteCommandFromToken.3.gz$Z 
    ln -sf $S CrtObjCmd.3.gz$Z Tcl_GetCommandInfo.3.gz$Z 
    ln -sf $S CrtObjCmd.3.gz$Z Tcl_GetCommandInfoFromToken.3.gz$Z 
    ln -sf $S CrtObjCmd.3.gz$Z Tcl_SetCommandInfo.3.gz$Z 
    ln -sf $S CrtObjCmd.3.gz$Z Tcl_SetCommandInfoFromToken.3.gz$Z 
    ln -sf $S CrtObjCmd.3.gz$Z Tcl_GetCommandName.3.gz$Z 
    ln -sf $S CrtObjCmd.3.gz$Z Tcl_GetCommandFullName.3.gz$Z 
    ln -sf $S CrtObjCmd.3.gz$Z Tcl_GetCommandFromObj.3.gz$Z 
fi
if test -r CrtSlave.3.gz; then
    rm -f CrtSlave.3.gz.*
    $ZIP CrtSlave.3.gz
    rm -f Tcl_IsSafe.3.gz Tcl_IsSafe.3.gz.* 
    rm -f Tcl_MakeSafe.3.gz Tcl_MakeSafe.3.gz.* 
    rm -f Tcl_CreateSlave.3.gz Tcl_CreateSlave.3.gz.* 
    rm -f Tcl_GetSlave.3.gz Tcl_GetSlave.3.gz.* 
    rm -f Tcl_GetMaster.3.gz Tcl_GetMaster.3.gz.* 
    rm -f Tcl_GetInterpPath.3.gz Tcl_GetInterpPath.3.gz.* 
    rm -f Tcl_CreateAlias.3.gz Tcl_CreateAlias.3.gz.* 
    rm -f Tcl_CreateAliasObj.3.gz Tcl_CreateAliasObj.3.gz.* 
    rm -f Tcl_GetAlias.3.gz Tcl_GetAlias.3.gz.* 
    rm -f Tcl_GetAliasObj.3.gz Tcl_GetAliasObj.3.gz.* 
    rm -f Tcl_ExposeCommand.3.gz Tcl_ExposeCommand.3.gz.* 
    rm -f Tcl_HideCommand.3.gz Tcl_HideCommand.3.gz.* 
    ln -sf $S CrtSlave.3.gz$Z Tcl_IsSafe.3.gz$Z 
    ln -sf $S CrtSlave.3.gz$Z Tcl_MakeSafe.3.gz$Z 
    ln -sf $S CrtSlave.3.gz$Z Tcl_CreateSlave.3.gz$Z 
    ln -sf $S CrtSlave.3.gz$Z Tcl_GetSlave.3.gz$Z 
    ln -sf $S CrtSlave.3.gz$Z Tcl_GetMaster.3.gz$Z 
    ln -sf $S CrtSlave.3.gz$Z Tcl_GetInterpPath.3.gz$Z 
    ln -sf $S CrtSlave.3.gz$Z Tcl_CreateAlias.3.gz$Z 
    ln -sf $S CrtSlave.3.gz$Z Tcl_CreateAliasObj.3.gz$Z 
    ln -sf $S CrtSlave.3.gz$Z Tcl_GetAlias.3.gz$Z 
    ln -sf $S CrtSlave.3.gz$Z Tcl_GetAliasObj.3.gz$Z 
    ln -sf $S CrtSlave.3.gz$Z Tcl_ExposeCommand.3.gz$Z 
    ln -sf $S CrtSlave.3.gz$Z Tcl_HideCommand.3.gz$Z 
fi
if test -r CrtTimerHdlr.3.gz; then
    rm -f CrtTimerHdlr.3.gz.*
    $ZIP CrtTimerHdlr.3.gz
    rm -f Tcl_CreateTimerHandler.3.gz Tcl_CreateTimerHandler.3.gz.* 
    rm -f Tcl_DeleteTimerHandler.3.gz Tcl_DeleteTimerHandler.3.gz.* 
    ln -sf $S CrtTimerHdlr.3.gz$Z Tcl_CreateTimerHandler.3.gz$Z 
    ln -sf $S CrtTimerHdlr.3.gz$Z Tcl_DeleteTimerHandler.3.gz$Z 
fi
if test -r CrtTrace.3.gz; then
    rm -f CrtTrace.3.gz.*
    $ZIP CrtTrace.3.gz
    rm -f Tcl_CreateTrace.3.gz Tcl_CreateTrace.3.gz.* 
    rm -f Tcl_CreateObjTrace.3.gz Tcl_CreateObjTrace.3.gz.* 
    rm -f Tcl_DeleteTrace.3.gz Tcl_DeleteTrace.3.gz.* 
    ln -sf $S CrtTrace.3.gz$Z Tcl_CreateTrace.3.gz$Z 
    ln -sf $S CrtTrace.3.gz$Z Tcl_CreateObjTrace.3.gz$Z 
    ln -sf $S CrtTrace.3.gz$Z Tcl_DeleteTrace.3.gz$Z 
fi
if test -r DString.3.gz; then
    rm -f DString.3.gz.*
    $ZIP DString.3.gz
    rm -f Tcl_DStringInit.3.gz Tcl_DStringInit.3.gz.* 
    rm -f Tcl_DStringAppend.3.gz Tcl_DStringAppend.3.gz.* 
    rm -f Tcl_DStringAppendElement.3.gz Tcl_DStringAppendElement.3.gz.* 
    rm -f Tcl_DStringStartSublist.3.gz Tcl_DStringStartSublist.3.gz.* 
    rm -f Tcl_DStringEndSublist.3.gz Tcl_DStringEndSublist.3.gz.* 
    rm -f Tcl_DStringLength.3.gz Tcl_DStringLength.3.gz.* 
    rm -f Tcl_DStringValue.3.gz Tcl_DStringValue.3.gz.* 
    rm -f Tcl_DStringSetLength.3.gz Tcl_DStringSetLength.3.gz.* 
    rm -f Tcl_DStringTrunc.3.gz Tcl_DStringTrunc.3.gz.* 
    rm -f Tcl_DStringFree.3.gz Tcl_DStringFree.3.gz.* 
    rm -f Tcl_DStringResult.3.gz Tcl_DStringResult.3.gz.* 
    rm -f Tcl_DStringGetResult.3.gz Tcl_DStringGetResult.3.gz.* 
    ln -sf $S DString.3.gz$Z Tcl_DStringInit.3.gz$Z 
    ln -sf $S DString.3.gz$Z Tcl_DStringAppend.3.gz$Z 
    ln -sf $S DString.3.gz$Z Tcl_DStringAppendElement.3.gz$Z 
    ln -sf $S DString.3.gz$Z Tcl_DStringStartSublist.3.gz$Z 
    ln -sf $S DString.3.gz$Z Tcl_DStringEndSublist.3.gz$Z 
    ln -sf $S DString.3.gz$Z Tcl_DStringLength.3.gz$Z 
    ln -sf $S DString.3.gz$Z Tcl_DStringValue.3.gz$Z 
    ln -sf $S DString.3.gz$Z Tcl_DStringSetLength.3.gz$Z 
    ln -sf $S DString.3.gz$Z Tcl_DStringTrunc.3.gz$Z 
    ln -sf $S DString.3.gz$Z Tcl_DStringFree.3.gz$Z 
    ln -sf $S DString.3.gz$Z Tcl_DStringResult.3.gz$Z 
    ln -sf $S DString.3.gz$Z Tcl_DStringGetResult.3.gz$Z 
fi
if test -r DetachPids.3.gz; then
    rm -f DetachPids.3.gz.*
    $ZIP DetachPids.3.gz
    rm -f Tcl_DetachPids.3.gz Tcl_DetachPids.3.gz.* 
    rm -f Tcl_ReapDetachedProcs.3.gz Tcl_ReapDetachedProcs.3.gz.* 
    rm -f Tcl_WaitPid.3.gz Tcl_WaitPid.3.gz.* 
    ln -sf $S DetachPids.3.gz$Z Tcl_DetachPids.3.gz$Z 
    ln -sf $S DetachPids.3.gz$Z Tcl_ReapDetachedProcs.3.gz$Z 
    ln -sf $S DetachPids.3.gz$Z Tcl_WaitPid.3.gz$Z 
fi
if test -r DoOneEvent.3.gz; then
    rm -f DoOneEvent.3.gz.*
    $ZIP DoOneEvent.3.gz
    rm -f Tcl_DoOneEvent.3.gz Tcl_DoOneEvent.3.gz.* 
    ln -sf $S DoOneEvent.3.gz$Z Tcl_DoOneEvent.3.gz$Z 
fi
if test -r DoWhenIdle.3.gz; then
    rm -f DoWhenIdle.3.gz.*
    $ZIP DoWhenIdle.3.gz
    rm -f Tcl_DoWhenIdle.3.gz Tcl_DoWhenIdle.3.gz.* 
    rm -f Tcl_CancelIdleCall.3.gz Tcl_CancelIdleCall.3.gz.* 
    ln -sf $S DoWhenIdle.3.gz$Z Tcl_DoWhenIdle.3.gz$Z 
    ln -sf $S DoWhenIdle.3.gz$Z Tcl_CancelIdleCall.3.gz$Z 
fi
if test -r DoubleObj.3.gz; then
    rm -f DoubleObj.3.gz.*
    $ZIP DoubleObj.3.gz
    rm -f Tcl_NewDoubleObj.3.gz Tcl_NewDoubleObj.3.gz.* 
    rm -f Tcl_SetDoubleObj.3.gz Tcl_SetDoubleObj.3.gz.* 
    rm -f Tcl_GetDoubleFromObj.3.gz Tcl_GetDoubleFromObj.3.gz.* 
    ln -sf $S DoubleObj.3.gz$Z Tcl_NewDoubleObj.3.gz$Z 
    ln -sf $S DoubleObj.3.gz$Z Tcl_SetDoubleObj.3.gz$Z 
    ln -sf $S DoubleObj.3.gz$Z Tcl_GetDoubleFromObj.3.gz$Z 
fi
if test -r DumpActiveMemory.3.gz; then
    rm -f DumpActiveMemory.3.gz.*
    $ZIP DumpActiveMemory.3.gz
    rm -f Tcl_DumpActiveMemory.3.gz Tcl_DumpActiveMemory.3.gz.* 
    rm -f Tcl_InitMemory.3.gz Tcl_InitMemory.3.gz.* 
    rm -f Tcl_ValidateAllMemory.3.gz Tcl_ValidateAllMemory.3.gz.* 
    ln -sf $S DumpActiveMemory.3.gz$Z Tcl_DumpActiveMemory.3.gz$Z 
    ln -sf $S DumpActiveMemory.3.gz$Z Tcl_InitMemory.3.gz$Z 
    ln -sf $S DumpActiveMemory.3.gz$Z Tcl_ValidateAllMemory.3.gz$Z 
fi
if test -r Encoding.3.gz; then
    rm -f Encoding.3.gz.*
    $ZIP Encoding.3.gz
    rm -f Tcl_GetEncoding.3.gz Tcl_GetEncoding.3.gz.* 
    rm -f Tcl_FreeEncoding.3.gz Tcl_FreeEncoding.3.gz.* 
    rm -f Tcl_ExternalToUtfDString.3.gz Tcl_ExternalToUtfDString.3.gz.* 
    rm -f Tcl_ExternalToUtf.3.gz Tcl_ExternalToUtf.3.gz.* 
    rm -f Tcl_UtfToExternalDString.3.gz Tcl_UtfToExternalDString.3.gz.* 
    rm -f Tcl_UtfToExternal.3.gz Tcl_UtfToExternal.3.gz.* 
    rm -f Tcl_WinTCharToUtf.3.gz Tcl_WinTCharToUtf.3.gz.* 
    rm -f Tcl_WinUtfToTChar.3.gz Tcl_WinUtfToTChar.3.gz.* 
    rm -f Tcl_GetEncodingName.3.gz Tcl_GetEncodingName.3.gz.* 
    rm -f Tcl_SetSystemEncoding.3.gz Tcl_SetSystemEncoding.3.gz.* 
    rm -f Tcl_GetEncodingNames.3.gz Tcl_GetEncodingNames.3.gz.* 
    rm -f Tcl_CreateEncoding.3.gz Tcl_CreateEncoding.3.gz.* 
    rm -f Tcl_GetDefaultEncodingDir.3.gz Tcl_GetDefaultEncodingDir.3.gz.* 
    rm -f Tcl_SetDefaultEncodingDir.3.gz Tcl_SetDefaultEncodingDir.3.gz.* 
    ln -sf $S Encoding.3.gz$Z Tcl_GetEncoding.3.gz$Z 
    ln -sf $S Encoding.3.gz$Z Tcl_FreeEncoding.3.gz$Z 
    ln -sf $S Encoding.3.gz$Z Tcl_ExternalToUtfDString.3.gz$Z 
    ln -sf $S Encoding.3.gz$Z Tcl_ExternalToUtf.3.gz$Z 
    ln -sf $S Encoding.3.gz$Z Tcl_UtfToExternalDString.3.gz$Z 
    ln -sf $S Encoding.3.gz$Z Tcl_UtfToExternal.3.gz$Z 
    ln -sf $S Encoding.3.gz$Z Tcl_WinTCharToUtf.3.gz$Z 
    ln -sf $S Encoding.3.gz$Z Tcl_WinUtfToTChar.3.gz$Z 
    ln -sf $S Encoding.3.gz$Z Tcl_GetEncodingName.3.gz$Z 
    ln -sf $S Encoding.3.gz$Z Tcl_SetSystemEncoding.3.gz$Z 
    ln -sf $S Encoding.3.gz$Z Tcl_GetEncodingNames.3.gz$Z 
    ln -sf $S Encoding.3.gz$Z Tcl_CreateEncoding.3.gz$Z 
    ln -sf $S Encoding.3.gz$Z Tcl_GetDefaultEncodingDir.3.gz$Z 
    ln -sf $S Encoding.3.gz$Z Tcl_SetDefaultEncodingDir.3.gz$Z 
fi
if test -r Environment.3.gz; then
    rm -f Environment.3.gz.*
    $ZIP Environment.3.gz
    rm -f Tcl_PutEnv.3.gz Tcl_PutEnv.3.gz.* 
    ln -sf $S Environment.3.gz$Z Tcl_PutEnv.3.gz$Z 
fi
if test -r Eval.3.gz; then
    rm -f Eval.3.gz.*
    $ZIP Eval.3.gz
    rm -f Tcl_EvalObjEx.3.gz Tcl_EvalObjEx.3.gz.* 
    rm -f Tcl_EvalFile.3.gz Tcl_EvalFile.3.gz.* 
    rm -f Tcl_EvalObjv.3.gz Tcl_EvalObjv.3.gz.* 
    rm -f Tcl_Eval.3.gz Tcl_Eval.3.gz.* 
    rm -f Tcl_EvalEx.3.gz Tcl_EvalEx.3.gz.* 
    rm -f Tcl_GlobalEval.3.gz Tcl_GlobalEval.3.gz.* 
    rm -f Tcl_GlobalEvalObj.3.gz Tcl_GlobalEvalObj.3.gz.* 
    rm -f Tcl_VarEval.3.gz Tcl_VarEval.3.gz.* 
    rm -f Tcl_VarEvalVA.3.gz Tcl_VarEvalVA.3.gz.* 
    ln -sf $S Eval.3.gz$Z Tcl_EvalObjEx.3.gz$Z 
    ln -sf $S Eval.3.gz$Z Tcl_EvalFile.3.gz$Z 
    ln -sf $S Eval.3.gz$Z Tcl_EvalObjv.3.gz$Z 
    ln -sf $S Eval.3.gz$Z Tcl_Eval.3.gz$Z 
    ln -sf $S Eval.3.gz$Z Tcl_EvalEx.3.gz$Z 
    ln -sf $S Eval.3.gz$Z Tcl_GlobalEval.3.gz$Z 
    ln -sf $S Eval.3.gz$Z Tcl_GlobalEvalObj.3.gz$Z 
    ln -sf $S Eval.3.gz$Z Tcl_VarEval.3.gz$Z 
    ln -sf $S Eval.3.gz$Z Tcl_VarEvalVA.3.gz$Z 
fi
if test -r Exit.3.gz; then
    rm -f Exit.3.gz.*
    $ZIP Exit.3.gz
    rm -f Tcl_Exit.3.gz Tcl_Exit.3.gz.* 
    rm -f Tcl_Finalize.3.gz Tcl_Finalize.3.gz.* 
    rm -f Tcl_CreateExitHandler.3.gz Tcl_CreateExitHandler.3.gz.* 
    rm -f Tcl_DeleteExitHandler.3.gz Tcl_DeleteExitHandler.3.gz.* 
    rm -f Tcl_ExitThread.3.gz Tcl_ExitThread.3.gz.* 
    rm -f Tcl_FinalizeThread.3.gz Tcl_FinalizeThread.3.gz.* 
    rm -f Tcl_CreateThreadExitHandler.3.gz Tcl_CreateThreadExitHandler.3.gz.* 
    rm -f Tcl_DeleteThreadExitHandler.3.gz Tcl_DeleteThreadExitHandler.3.gz.* 
    ln -sf $S Exit.3.gz$Z Tcl_Exit.3.gz$Z 
    ln -sf $S Exit.3.gz$Z Tcl_Finalize.3.gz$Z 
    ln -sf $S Exit.3.gz$Z Tcl_CreateExitHandler.3.gz$Z 
    ln -sf $S Exit.3.gz$Z Tcl_DeleteExitHandler.3.gz$Z 
    ln -sf $S Exit.3.gz$Z Tcl_ExitThread.3.gz$Z 
    ln -sf $S Exit.3.gz$Z Tcl_FinalizeThread.3.gz$Z 
    ln -sf $S Exit.3.gz$Z Tcl_CreateThreadExitHandler.3.gz$Z 
    ln -sf $S Exit.3.gz$Z Tcl_DeleteThreadExitHandler.3.gz$Z 
fi
if test -r ExprLong.3.gz; then
    rm -f ExprLong.3.gz.*
    $ZIP ExprLong.3.gz
    rm -f Tcl_ExprLong.3.gz Tcl_ExprLong.3.gz.* 
    rm -f Tcl_ExprDouble.3.gz Tcl_ExprDouble.3.gz.* 
    rm -f Tcl_ExprBoolean.3.gz Tcl_ExprBoolean.3.gz.* 
    rm -f Tcl_ExprString.3.gz Tcl_ExprString.3.gz.* 
    ln -sf $S ExprLong.3.gz$Z Tcl_ExprLong.3.gz$Z 
    ln -sf $S ExprLong.3.gz$Z Tcl_ExprDouble.3.gz$Z 
    ln -sf $S ExprLong.3.gz$Z Tcl_ExprBoolean.3.gz$Z 
    ln -sf $S ExprLong.3.gz$Z Tcl_ExprString.3.gz$Z 
fi
if test -r ExprLongObj.3.gz; then
    rm -f ExprLongObj.3.gz.*
    $ZIP ExprLongObj.3.gz
    rm -f Tcl_ExprLongObj.3.gz Tcl_ExprLongObj.3.gz.* 
    rm -f Tcl_ExprDoubleObj.3.gz Tcl_ExprDoubleObj.3.gz.* 
    rm -f Tcl_ExprBooleanObj.3.gz Tcl_ExprBooleanObj.3.gz.* 
    rm -f Tcl_ExprObj.3.gz Tcl_ExprObj.3.gz.* 
    ln -sf $S ExprLongObj.3.gz$Z Tcl_ExprLongObj.3.gz$Z 
    ln -sf $S ExprLongObj.3.gz$Z Tcl_ExprDoubleObj.3.gz$Z 
    ln -sf $S ExprLongObj.3.gz$Z Tcl_ExprBooleanObj.3.gz$Z 
    ln -sf $S ExprLongObj.3.gz$Z Tcl_ExprObj.3.gz$Z 
fi
if test -r FileSystem.3.gz; then
    rm -f FileSystem.3.gz.*
    $ZIP FileSystem.3.gz
    rm -f Tcl_FSRegister.3.gz Tcl_FSRegister.3.gz.* 
    rm -f Tcl_FSUnregister.3.gz Tcl_FSUnregister.3.gz.* 
    rm -f Tcl_FSData.3.gz Tcl_FSData.3.gz.* 
    rm -f Tcl_FSMountsChanged.3.gz Tcl_FSMountsChanged.3.gz.* 
    rm -f Tcl_FSGetFileSystemForPath.3.gz Tcl_FSGetFileSystemForPath.3.gz.* 
    rm -f Tcl_FSGetPathType.3.gz Tcl_FSGetPathType.3.gz.* 
    rm -f Tcl_FSCopyFile.3.gz Tcl_FSCopyFile.3.gz.* 
    rm -f Tcl_FSCopyDirectory.3.gz Tcl_FSCopyDirectory.3.gz.* 
    rm -f Tcl_FSCreateDirectory.3.gz Tcl_FSCreateDirectory.3.gz.* 
    rm -f Tcl_FSDeleteFile.3.gz Tcl_FSDeleteFile.3.gz.* 
    rm -f Tcl_FSRemoveDirectory.3.gz Tcl_FSRemoveDirectory.3.gz.* 
    rm -f Tcl_FSRenameFile.3.gz Tcl_FSRenameFile.3.gz.* 
    rm -f Tcl_FSListVolumes.3.gz Tcl_FSListVolumes.3.gz.* 
    rm -f Tcl_FSEvalFile.3.gz Tcl_FSEvalFile.3.gz.* 
    rm -f Tcl_FSLoadFile.3.gz Tcl_FSLoadFile.3.gz.* 
    rm -f Tcl_FSMatchInDirectory.3.gz Tcl_FSMatchInDirectory.3.gz.* 
    rm -f Tcl_FSLink.3.gz Tcl_FSLink.3.gz.* 
    rm -f Tcl_FSLstat.3.gz Tcl_FSLstat.3.gz.* 
    rm -f Tcl_FSUtime.3.gz Tcl_FSUtime.3.gz.* 
    rm -f Tcl_FSFileAttrsGet.3.gz Tcl_FSFileAttrsGet.3.gz.* 
    rm -f Tcl_FSFileAttrsSet.3.gz Tcl_FSFileAttrsSet.3.gz.* 
    rm -f Tcl_FSFileAttrStrings.3.gz Tcl_FSFileAttrStrings.3.gz.* 
    rm -f Tcl_FSStat.3.gz Tcl_FSStat.3.gz.* 
    rm -f Tcl_FSAccess.3.gz Tcl_FSAccess.3.gz.* 
    rm -f Tcl_FSOpenFileChannel.3.gz Tcl_FSOpenFileChannel.3.gz.* 
    rm -f Tcl_FSGetCwd.3.gz Tcl_FSGetCwd.3.gz.* 
    rm -f Tcl_FSChdir.3.gz Tcl_FSChdir.3.gz.* 
    rm -f Tcl_FSPathSeparator.3.gz Tcl_FSPathSeparator.3.gz.* 
    rm -f Tcl_FSJoinPath.3.gz Tcl_FSJoinPath.3.gz.* 
    rm -f Tcl_FSSplitPath.3.gz Tcl_FSSplitPath.3.gz.* 
    rm -f Tcl_FSEqualPaths.3.gz Tcl_FSEqualPaths.3.gz.* 
    rm -f Tcl_FSGetNormalizedPath.3.gz Tcl_FSGetNormalizedPath.3.gz.* 
    rm -f Tcl_FSJoinToPath.3.gz Tcl_FSJoinToPath.3.gz.* 
    rm -f Tcl_FSConvertToPathType.3.gz Tcl_FSConvertToPathType.3.gz.* 
    rm -f Tcl_FSGetInternalRep.3.gz Tcl_FSGetInternalRep.3.gz.* 
    rm -f Tcl_FSGetTranslatedPath.3.gz Tcl_FSGetTranslatedPath.3.gz.* 
    rm -f Tcl_FSGetTranslatedStringPath.3.gz Tcl_FSGetTranslatedStringPath.3.gz.* 
    rm -f Tcl_FSNewNativePath.3.gz Tcl_FSNewNativePath.3.gz.* 
    rm -f Tcl_FSGetNativePath.3.gz Tcl_FSGetNativePath.3.gz.* 
    rm -f Tcl_FSFileSystemInfo.3.gz Tcl_FSFileSystemInfo.3.gz.* 
    rm -f Tcl_AllocStatBuf.3.gz Tcl_AllocStatBuf.3.gz.* 
    ln -sf $S FileSystem.3.gz$Z Tcl_FSRegister.3.gz$Z 
    ln -sf $S FileSystem.3.gz$Z Tcl_FSUnregister.3.gz$Z 
    ln -sf $S FileSystem.3.gz$Z Tcl_FSData.3.gz$Z 
    ln -sf $S FileSystem.3.gz$Z Tcl_FSMountsChanged.3.gz$Z 
    ln -sf $S FileSystem.3.gz$Z Tcl_FSGetFileSystemForPath.3.gz$Z 
    ln -sf $S FileSystem.3.gz$Z Tcl_FSGetPathType.3.gz$Z 
    ln -sf $S FileSystem.3.gz$Z Tcl_FSCopyFile.3.gz$Z 
    ln -sf $S FileSystem.3.gz$Z Tcl_FSCopyDirectory.3.gz$Z 
    ln -sf $S FileSystem.3.gz$Z Tcl_FSCreateDirectory.3.gz$Z 
    ln -sf $S FileSystem.3.gz$Z Tcl_FSDeleteFile.3.gz$Z 
    ln -sf $S FileSystem.3.gz$Z Tcl_FSRemoveDirectory.3.gz$Z 
    ln -sf $S FileSystem.3.gz$Z Tcl_FSRenameFile.3.gz$Z 
    ln -sf $S FileSystem.3.gz$Z Tcl_FSListVolumes.3.gz$Z 
    ln -sf $S FileSystem.3.gz$Z Tcl_FSEvalFile.3.gz$Z 
    ln -sf $S FileSystem.3.gz$Z Tcl_FSLoadFile.3.gz$Z 
    ln -sf $S FileSystem.3.gz$Z Tcl_FSMatchInDirectory.3.gz$Z 
    ln -sf $S FileSystem.3.gz$Z Tcl_FSLink.3.gz$Z 
    ln -sf $S FileSystem.3.gz$Z Tcl_FSLstat.3.gz$Z 
    ln -sf $S FileSystem.3.gz$Z Tcl_FSUtime.3.gz$Z 
    ln -sf $S FileSystem.3.gz$Z Tcl_FSFileAttrsGet.3.gz$Z 
    ln -sf $S FileSystem.3.gz$Z Tcl_FSFileAttrsSet.3.gz$Z 
    ln -sf $S FileSystem.3.gz$Z Tcl_FSFileAttrStrings.3.gz$Z 
    ln -sf $S FileSystem.3.gz$Z Tcl_FSStat.3.gz$Z 
    ln -sf $S FileSystem.3.gz$Z Tcl_FSAccess.3.gz$Z 
    ln -sf $S FileSystem.3.gz$Z Tcl_FSOpenFileChannel.3.gz$Z 
    ln -sf $S FileSystem.3.gz$Z Tcl_FSGetCwd.3.gz$Z 
    ln -sf $S FileSystem.3.gz$Z Tcl_FSChdir.3.gz$Z 
    ln -sf $S FileSystem.3.gz$Z Tcl_FSPathSeparator.3.gz$Z 
    ln -sf $S FileSystem.3.gz$Z Tcl_FSJoinPath.3.gz$Z 
    ln -sf $S FileSystem.3.gz$Z Tcl_FSSplitPath.3.gz$Z 
    ln -sf $S FileSystem.3.gz$Z Tcl_FSEqualPaths.3.gz$Z 
    ln -sf $S FileSystem.3.gz$Z Tcl_FSGetNormalizedPath.3.gz$Z 
    ln -sf $S FileSystem.3.gz$Z Tcl_FSJoinToPath.3.gz$Z 
    ln -sf $S FileSystem.3.gz$Z Tcl_FSConvertToPathType.3.gz$Z 
    ln -sf $S FileSystem.3.gz$Z Tcl_FSGetInternalRep.3.gz$Z 
    ln -sf $S FileSystem.3.gz$Z Tcl_FSGetTranslatedPath.3.gz$Z 
    ln -sf $S FileSystem.3.gz$Z Tcl_FSGetTranslatedStringPath.3.gz$Z 
    ln -sf $S FileSystem.3.gz$Z Tcl_FSNewNativePath.3.gz$Z 
    ln -sf $S FileSystem.3.gz$Z Tcl_FSGetNativePath.3.gz$Z 
    ln -sf $S FileSystem.3.gz$Z Tcl_FSFileSystemInfo.3.gz$Z 
    ln -sf $S FileSystem.3.gz$Z Tcl_AllocStatBuf.3.gz$Z 
fi
if test -r FindExec.3.gz; then
    rm -f FindExec.3.gz.*
    $ZIP FindExec.3.gz
    rm -f Tcl_FindExecutable.3.gz Tcl_FindExecutable.3.gz.* 
    rm -f Tcl_GetNameOfExecutable.3.gz Tcl_GetNameOfExecutable.3.gz.* 
    ln -sf $S FindExec.3.gz$Z Tcl_FindExecutable.3.gz$Z 
    ln -sf $S FindExec.3.gz$Z Tcl_GetNameOfExecutable.3.gz$Z 
fi
if test -r GetCwd.3.gz; then
    rm -f GetCwd.3.gz.*
    $ZIP GetCwd.3.gz
    rm -f Tcl_GetCwd.3.gz Tcl_GetCwd.3.gz.* 
    rm -f Tcl_Chdir.3.gz Tcl_Chdir.3.gz.* 
    ln -sf $S GetCwd.3.gz$Z Tcl_GetCwd.3.gz$Z 
    ln -sf $S GetCwd.3.gz$Z Tcl_Chdir.3.gz$Z 
fi
if test -r GetHostName.3.gz; then
    rm -f GetHostName.3.gz.*
    $ZIP GetHostName.3.gz
    rm -f Tcl_GetHostName.3.gz Tcl_GetHostName.3.gz.* 
    ln -sf $S GetHostName.3.gz$Z Tcl_GetHostName.3.gz$Z 
fi
if test -r GetIndex.3.gz; then
    rm -f GetIndex.3.gz.*
    $ZIP GetIndex.3.gz
    rm -f Tcl_GetIndexFromObj.3.gz Tcl_GetIndexFromObj.3.gz.* 
    rm -f Tcl_GetIndexFromObjStruct.3.gz Tcl_GetIndexFromObjStruct.3.gz.* 
    ln -sf $S GetIndex.3.gz$Z Tcl_GetIndexFromObj.3.gz$Z 
    ln -sf $S GetIndex.3.gz$Z Tcl_GetIndexFromObjStruct.3.gz$Z 
fi
if test -r GetInt.3.gz; then
    rm -f GetInt.3.gz.*
    $ZIP GetInt.3.gz
    rm -f Tcl_GetInt.3.gz Tcl_GetInt.3.gz.* 
    rm -f Tcl_GetDouble.3.gz Tcl_GetDouble.3.gz.* 
    rm -f Tcl_GetBoolean.3.gz Tcl_GetBoolean.3.gz.* 
    ln -sf $S GetInt.3.gz$Z Tcl_GetInt.3.gz$Z 
    ln -sf $S GetInt.3.gz$Z Tcl_GetDouble.3.gz$Z 
    ln -sf $S GetInt.3.gz$Z Tcl_GetBoolean.3.gz$Z 
fi
if test -r GetOpnFl.3.gz; then
    rm -f GetOpnFl.3.gz.*
    $ZIP GetOpnFl.3.gz
    rm -f Tcl_GetOpenFile.3.gz Tcl_GetOpenFile.3.gz.* 
    ln -sf $S GetOpnFl.3.gz$Z Tcl_GetOpenFile.3.gz$Z 
fi
if test -r GetStdChan.3.gz; then
    rm -f GetStdChan.3.gz.*
    $ZIP GetStdChan.3.gz
    rm -f Tcl_GetStdChannel.3.gz Tcl_GetStdChannel.3.gz.* 
    rm -f Tcl_SetStdChannel.3.gz Tcl_SetStdChannel.3.gz.* 
    ln -sf $S GetStdChan.3.gz$Z Tcl_GetStdChannel.3.gz$Z 
    ln -sf $S GetStdChan.3.gz$Z Tcl_SetStdChannel.3.gz$Z 
fi
if test -r GetTime.3.gz; then
    rm -f GetTime.3.gz.*
    $ZIP GetTime.3.gz
    rm -f Tcl_GetTime.3.gz Tcl_GetTime.3.gz.* 
    ln -sf $S GetTime.3.gz$Z Tcl_GetTime.3.gz$Z 
fi
if test -r GetVersion.3.gz; then
    rm -f GetVersion.3.gz.*
    $ZIP GetVersion.3.gz
    rm -f Tcl_GetVersion.3.gz Tcl_GetVersion.3.gz.* 
    ln -sf $S GetVersion.3.gz$Z Tcl_GetVersion.3.gz$Z 
fi
if test -r Hash.3.gz; then
    rm -f Hash.3.gz.*
    $ZIP Hash.3.gz
    rm -f Tcl_InitHashTable.3.gz Tcl_InitHashTable.3.gz.* 
    rm -f Tcl_InitCustomHashTable.3.gz Tcl_InitCustomHashTable.3.gz.* 
    rm -f Tcl_InitObjHashTable.3.gz Tcl_InitObjHashTable.3.gz.* 
    rm -f Tcl_DeleteHashTable.3.gz Tcl_DeleteHashTable.3.gz.* 
    rm -f Tcl_CreateHashEntry.3.gz Tcl_CreateHashEntry.3.gz.* 
    rm -f Tcl_DeleteHashEntry.3.gz Tcl_DeleteHashEntry.3.gz.* 
    rm -f Tcl_FindHashEntry.3.gz Tcl_FindHashEntry.3.gz.* 
    rm -f Tcl_GetHashValue.3.gz Tcl_GetHashValue.3.gz.* 
    rm -f Tcl_SetHashValue.3.gz Tcl_SetHashValue.3.gz.* 
    rm -f Tcl_GetHashKey.3.gz Tcl_GetHashKey.3.gz.* 
    rm -f Tcl_FirstHashEntry.3.gz Tcl_FirstHashEntry.3.gz.* 
    rm -f Tcl_NextHashEntry.3.gz Tcl_NextHashEntry.3.gz.* 
    rm -f Tcl_HashStats.3.gz Tcl_HashStats.3.gz.* 
    ln -sf $S Hash.3.gz$Z Tcl_InitHashTable.3.gz$Z 
    ln -sf $S Hash.3.gz$Z Tcl_InitCustomHashTable.3.gz$Z 
    ln -sf $S Hash.3.gz$Z Tcl_InitObjHashTable.3.gz$Z 
    ln -sf $S Hash.3.gz$Z Tcl_DeleteHashTable.3.gz$Z 
    ln -sf $S Hash.3.gz$Z Tcl_CreateHashEntry.3.gz$Z 
    ln -sf $S Hash.3.gz$Z Tcl_DeleteHashEntry.3.gz$Z 
    ln -sf $S Hash.3.gz$Z Tcl_FindHashEntry.3.gz$Z 
    ln -sf $S Hash.3.gz$Z Tcl_GetHashValue.3.gz$Z 
    ln -sf $S Hash.3.gz$Z Tcl_SetHashValue.3.gz$Z 
    ln -sf $S Hash.3.gz$Z Tcl_GetHashKey.3.gz$Z 
    ln -sf $S Hash.3.gz$Z Tcl_FirstHashEntry.3.gz$Z 
    ln -sf $S Hash.3.gz$Z Tcl_NextHashEntry.3.gz$Z 
    ln -sf $S Hash.3.gz$Z Tcl_HashStats.3.gz$Z 
fi
if test -r Init.3.gz; then
    rm -f Init.3.gz.*
    $ZIP Init.3.gz
    rm -f Tcl_Init.3.gz Tcl_Init.3.gz.* 
    ln -sf $S Init.3.gz$Z Tcl_Init.3.gz$Z 
fi
if test -r InitStubs.3.gz; then
    rm -f InitStubs.3.gz.*
    $ZIP InitStubs.3.gz
    rm -f Tcl_InitStubs.3.gz Tcl_InitStubs.3.gz.* 
    ln -sf $S InitStubs.3.gz$Z Tcl_InitStubs.3.gz$Z 
fi
if test -r IntObj.3.gz; then
    rm -f IntObj.3.gz.*
    $ZIP IntObj.3.gz
    rm -f Tcl_NewIntObj.3.gz Tcl_NewIntObj.3.gz.* 
    rm -f Tcl_NewLongObj.3.gz Tcl_NewLongObj.3.gz.* 
    rm -f Tcl_NewWideIntObj.3.gz Tcl_NewWideIntObj.3.gz.* 
    rm -f Tcl_SetIntObj.3.gz Tcl_SetIntObj.3.gz.* 
    rm -f Tcl_SetLongObj.3.gz Tcl_SetLongObj.3.gz.* 
    rm -f Tcl_SetWideIntObj.3.gz Tcl_SetWideIntObj.3.gz.* 
    rm -f Tcl_GetIntFromObj.3.gz Tcl_GetIntFromObj.3.gz.* 
    rm -f Tcl_GetLongFromObj.3.gz Tcl_GetLongFromObj.3.gz.* 
    rm -f Tcl_GetWideIntFromObj.3.gz Tcl_GetWideIntFromObj.3.gz.* 
    ln -sf $S IntObj.3.gz$Z Tcl_NewIntObj.3.gz$Z 
    ln -sf $S IntObj.3.gz$Z Tcl_NewLongObj.3.gz$Z 
    ln -sf $S IntObj.3.gz$Z Tcl_NewWideIntObj.3.gz$Z 
    ln -sf $S IntObj.3.gz$Z Tcl_SetIntObj.3.gz$Z 
    ln -sf $S IntObj.3.gz$Z Tcl_SetLongObj.3.gz$Z 
    ln -sf $S IntObj.3.gz$Z Tcl_SetWideIntObj.3.gz$Z 
    ln -sf $S IntObj.3.gz$Z Tcl_GetIntFromObj.3.gz$Z 
    ln -sf $S IntObj.3.gz$Z Tcl_GetLongFromObj.3.gz$Z 
    ln -sf $S IntObj.3.gz$Z Tcl_GetWideIntFromObj.3.gz$Z 
fi
if test -r Interp.3.gz; then
    rm -f Interp.3.gz.*
    $ZIP Interp.3.gz
    rm -f Tcl_Interp.3.gz Tcl_Interp.3.gz.* 
    ln -sf $S Interp.3.gz$Z Tcl_Interp.3.gz$Z 
fi
if test -r LinkVar.3.gz; then
    rm -f LinkVar.3.gz.*
    $ZIP LinkVar.3.gz
    rm -f Tcl_LinkVar.3.gz Tcl_LinkVar.3.gz.* 
    rm -f Tcl_UnlinkVar.3.gz Tcl_UnlinkVar.3.gz.* 
    rm -f Tcl_UpdateLinkedVar.3.gz Tcl_UpdateLinkedVar.3.gz.* 
    ln -sf $S LinkVar.3.gz$Z Tcl_LinkVar.3.gz$Z 
    ln -sf $S LinkVar.3.gz$Z Tcl_UnlinkVar.3.gz$Z 
    ln -sf $S LinkVar.3.gz$Z Tcl_UpdateLinkedVar.3.gz$Z 
fi
if test -r ListObj.3.gz; then
    rm -f ListObj.3.gz.*
    $ZIP ListObj.3.gz
    rm -f Tcl_ListObjAppendList.3.gz Tcl_ListObjAppendList.3.gz.* 
    rm -f Tcl_ListObjAppendElement.3.gz Tcl_ListObjAppendElement.3.gz.* 
    rm -f Tcl_NewListObj.3.gz Tcl_NewListObj.3.gz.* 
    rm -f Tcl_SetListObj.3.gz Tcl_SetListObj.3.gz.* 
    rm -f Tcl_ListObjGetElements.3.gz Tcl_ListObjGetElements.3.gz.* 
    rm -f Tcl_ListObjLength.3.gz Tcl_ListObjLength.3.gz.* 
    rm -f Tcl_ListObjIndex.3.gz Tcl_ListObjIndex.3.gz.* 
    rm -f Tcl_ListObjReplace.3.gz Tcl_ListObjReplace.3.gz.* 
    ln -sf $S ListObj.3.gz$Z Tcl_ListObjAppendList.3.gz$Z 
    ln -sf $S ListObj.3.gz$Z Tcl_ListObjAppendElement.3.gz$Z 
    ln -sf $S ListObj.3.gz$Z Tcl_NewListObj.3.gz$Z 
    ln -sf $S ListObj.3.gz$Z Tcl_SetListObj.3.gz$Z 
    ln -sf $S ListObj.3.gz$Z Tcl_ListObjGetElements.3.gz$Z 
    ln -sf $S ListObj.3.gz$Z Tcl_ListObjLength.3.gz$Z 
    ln -sf $S ListObj.3.gz$Z Tcl_ListObjIndex.3.gz$Z 
    ln -sf $S ListObj.3.gz$Z Tcl_ListObjReplace.3.gz$Z 
fi
if test -r Macintosh.3.gz; then
    rm -f Macintosh.3.gz.*
    $ZIP Macintosh.3.gz
    rm -f Tcl_MacSetEventProc.3.gz Tcl_MacSetEventProc.3.gz.* 
    rm -f Tcl_MacConvertTextResource.3.gz Tcl_MacConvertTextResource.3.gz.* 
    rm -f Tcl_MacEvalResource.3.gz Tcl_MacEvalResource.3.gz.* 
    rm -f Tcl_MacFindResource.3.gz Tcl_MacFindResource.3.gz.* 
    rm -f Tcl_GetOSTypeFromObj.3.gz Tcl_GetOSTypeFromObj.3.gz.* 
    rm -f Tcl_SetOSTypeObj.3.gz Tcl_SetOSTypeObj.3.gz.* 
    rm -f Tcl_NewOSTypeObj.3.gz Tcl_NewOSTypeObj.3.gz.* 
    ln -sf $S Macintosh.3.gz$Z Tcl_MacSetEventProc.3.gz$Z 
    ln -sf $S Macintosh.3.gz$Z Tcl_MacConvertTextResource.3.gz$Z 
    ln -sf $S Macintosh.3.gz$Z Tcl_MacEvalResource.3.gz$Z 
    ln -sf $S Macintosh.3.gz$Z Tcl_MacFindResource.3.gz$Z 
    ln -sf $S Macintosh.3.gz$Z Tcl_GetOSTypeFromObj.3.gz$Z 
    ln -sf $S Macintosh.3.gz$Z Tcl_SetOSTypeObj.3.gz$Z 
    ln -sf $S Macintosh.3.gz$Z Tcl_NewOSTypeObj.3.gz$Z 
fi
if test -r Notifier.3.gz; then
    rm -f Notifier.3.gz.*
    $ZIP Notifier.3.gz
    rm -f Tcl_CreateEventSource.3.gz Tcl_CreateEventSource.3.gz.* 
    rm -f Tcl_DeleteEventSource.3.gz Tcl_DeleteEventSource.3.gz.* 
    rm -f Tcl_SetMaxBlockTime.3.gz Tcl_SetMaxBlockTime.3.gz.* 
    rm -f Tcl_QueueEvent.3.gz Tcl_QueueEvent.3.gz.* 
    rm -f Tcl_ThreadQueueEvent.3.gz Tcl_ThreadQueueEvent.3.gz.* 
    rm -f Tcl_ThreadAlert.3.gz Tcl_ThreadAlert.3.gz.* 
    rm -f Tcl_GetCurrentThread.3.gz Tcl_GetCurrentThread.3.gz.* 
    rm -f Tcl_DeleteEvents.3.gz Tcl_DeleteEvents.3.gz.* 
    rm -f Tcl_InitNotifier.3.gz Tcl_InitNotifier.3.gz.* 
    rm -f Tcl_FinalizeNotifier.3.gz Tcl_FinalizeNotifier.3.gz.* 
    rm -f Tcl_WaitForEvent.3.gz Tcl_WaitForEvent.3.gz.* 
    rm -f Tcl_AlertNotifier.3.gz Tcl_AlertNotifier.3.gz.* 
    rm -f Tcl_SetTimer.3.gz Tcl_SetTimer.3.gz.* 
    rm -f Tcl_ServiceAll.3.gz Tcl_ServiceAll.3.gz.* 
    rm -f Tcl_ServiceEvent.3.gz Tcl_ServiceEvent.3.gz.* 
    rm -f Tcl_GetServiceMode.3.gz Tcl_GetServiceMode.3.gz.* 
    rm -f Tcl_SetServiceMode.3.gz Tcl_SetServiceMode.3.gz.* 
    ln -sf $S Notifier.3.gz$Z Tcl_CreateEventSource.3.gz$Z 
    ln -sf $S Notifier.3.gz$Z Tcl_DeleteEventSource.3.gz$Z 
    ln -sf $S Notifier.3.gz$Z Tcl_SetMaxBlockTime.3.gz$Z 
    ln -sf $S Notifier.3.gz$Z Tcl_QueueEvent.3.gz$Z 
    ln -sf $S Notifier.3.gz$Z Tcl_ThreadQueueEvent.3.gz$Z 
    ln -sf $S Notifier.3.gz$Z Tcl_ThreadAlert.3.gz$Z 
    ln -sf $S Notifier.3.gz$Z Tcl_GetCurrentThread.3.gz$Z 
    ln -sf $S Notifier.3.gz$Z Tcl_DeleteEvents.3.gz$Z 
    ln -sf $S Notifier.3.gz$Z Tcl_InitNotifier.3.gz$Z 
    ln -sf $S Notifier.3.gz$Z Tcl_FinalizeNotifier.3.gz$Z 
    ln -sf $S Notifier.3.gz$Z Tcl_WaitForEvent.3.gz$Z 
    ln -sf $S Notifier.3.gz$Z Tcl_AlertNotifier.3.gz$Z 
    ln -sf $S Notifier.3.gz$Z Tcl_SetTimer.3.gz$Z 
    ln -sf $S Notifier.3.gz$Z Tcl_ServiceAll.3.gz$Z 
    ln -sf $S Notifier.3.gz$Z Tcl_ServiceEvent.3.gz$Z 
    ln -sf $S Notifier.3.gz$Z Tcl_GetServiceMode.3.gz$Z 
    ln -sf $S Notifier.3.gz$Z Tcl_SetServiceMode.3.gz$Z 
fi
if test -r Object.3.gz; then
    rm -f Object.3.gz.*
    $ZIP Object.3.gz
    rm -f Tcl_NewObj.3.gz Tcl_NewObj.3.gz.* 
    rm -f Tcl_DuplicateObj.3.gz Tcl_DuplicateObj.3.gz.* 
    rm -f Tcl_IncrRefCount.3.gz Tcl_IncrRefCount.3.gz.* 
    rm -f Tcl_DecrRefCount.3.gz Tcl_DecrRefCount.3.gz.* 
    rm -f Tcl_IsShared.3.gz Tcl_IsShared.3.gz.* 
    rm -f Tcl_InvalidateStringRep.3.gz Tcl_InvalidateStringRep.3.gz.* 
    ln -sf $S Object.3.gz$Z Tcl_NewObj.3.gz$Z 
    ln -sf $S Object.3.gz$Z Tcl_DuplicateObj.3.gz$Z 
    ln -sf $S Object.3.gz$Z Tcl_IncrRefCount.3.gz$Z 
    ln -sf $S Object.3.gz$Z Tcl_DecrRefCount.3.gz$Z 
    ln -sf $S Object.3.gz$Z Tcl_IsShared.3.gz$Z 
    ln -sf $S Object.3.gz$Z Tcl_InvalidateStringRep.3.gz$Z 
fi
if test -r ObjectType.3.gz; then
    rm -f ObjectType.3.gz.*
    $ZIP ObjectType.3.gz
    rm -f Tcl_RegisterObjType.3.gz Tcl_RegisterObjType.3.gz.* 
    rm -f Tcl_GetObjType.3.gz Tcl_GetObjType.3.gz.* 
    rm -f Tcl_AppendAllObjTypes.3.gz Tcl_AppendAllObjTypes.3.gz.* 
    rm -f Tcl_ConvertToType.3.gz Tcl_ConvertToType.3.gz.* 
    ln -sf $S ObjectType.3.gz$Z Tcl_RegisterObjType.3.gz$Z 
    ln -sf $S ObjectType.3.gz$Z Tcl_GetObjType.3.gz$Z 
    ln -sf $S ObjectType.3.gz$Z Tcl_AppendAllObjTypes.3.gz$Z 
    ln -sf $S ObjectType.3.gz$Z Tcl_ConvertToType.3.gz$Z 
fi
if test -r OpenFileChnl.3.gz; then
    rm -f OpenFileChnl.3.gz.*
    $ZIP OpenFileChnl.3.gz
    rm -f Tcl_OpenFileChannel.3.gz Tcl_OpenFileChannel.3.gz.* 
    rm -f Tcl_OpenCommandChannel.3.gz Tcl_OpenCommandChannel.3.gz.* 
    rm -f Tcl_MakeFileChannel.3.gz Tcl_MakeFileChannel.3.gz.* 
    rm -f Tcl_GetChannel.3.gz Tcl_GetChannel.3.gz.* 
    rm -f Tcl_GetChannelNames.3.gz Tcl_GetChannelNames.3.gz.* 
    rm -f Tcl_GetChannelNamesEx.3.gz Tcl_GetChannelNamesEx.3.gz.* 
    rm -f Tcl_RegisterChannel.3.gz Tcl_RegisterChannel.3.gz.* 
    rm -f Tcl_UnregisterChannel.3.gz Tcl_UnregisterChannel.3.gz.* 
    rm -f Tcl_DetachChannel.3.gz Tcl_DetachChannel.3.gz.* 
    rm -f Tcl_IsStandardChannel.3.gz Tcl_IsStandardChannel.3.gz.* 
    rm -f Tcl_Close.3.gz Tcl_Close.3.gz.* 
    rm -f Tcl_ReadChars.3.gz Tcl_ReadChars.3.gz.* 
    rm -f Tcl_Read.3.gz Tcl_Read.3.gz.* 
    rm -f Tcl_GetsObj.3.gz Tcl_GetsObj.3.gz.* 
    rm -f Tcl_Gets.3.gz Tcl_Gets.3.gz.* 
    rm -f Tcl_WriteObj.3.gz Tcl_WriteObj.3.gz.* 
    rm -f Tcl_WriteChars.3.gz Tcl_WriteChars.3.gz.* 
    rm -f Tcl_Write.3.gz Tcl_Write.3.gz.* 
    rm -f Tcl_Flush.3.gz Tcl_Flush.3.gz.* 
    rm -f Tcl_Seek.3.gz Tcl_Seek.3.gz.* 
    rm -f Tcl_Tell.3.gz Tcl_Tell.3.gz.* 
    rm -f Tcl_GetChannelOption.3.gz Tcl_GetChannelOption.3.gz.* 
    rm -f Tcl_SetChannelOption.3.gz Tcl_SetChannelOption.3.gz.* 
    rm -f Tcl_Eof.3.gz Tcl_Eof.3.gz.* 
    rm -f Tcl_InputBlocked.3.gz Tcl_InputBlocked.3.gz.* 
    rm -f Tcl_InputBuffered.3.gz Tcl_InputBuffered.3.gz.* 
    rm -f Tcl_OutputBuffered.3.gz Tcl_OutputBuffered.3.gz.* 
    rm -f Tcl_Ungets.3.gz Tcl_Ungets.3.gz.* 
    rm -f Tcl_ReadRaw.3.gz Tcl_ReadRaw.3.gz.* 
    rm -f Tcl_WriteRaw.3.gz Tcl_WriteRaw.3.gz.* 
    ln -sf $S OpenFileChnl.3.gz$Z Tcl_OpenFileChannel.3.gz$Z 
    ln -sf $S OpenFileChnl.3.gz$Z Tcl_OpenCommandChannel.3.gz$Z 
    ln -sf $S OpenFileChnl.3.gz$Z Tcl_MakeFileChannel.3.gz$Z 
    ln -sf $S OpenFileChnl.3.gz$Z Tcl_GetChannel.3.gz$Z 
    ln -sf $S OpenFileChnl.3.gz$Z Tcl_GetChannelNames.3.gz$Z 
    ln -sf $S OpenFileChnl.3.gz$Z Tcl_GetChannelNamesEx.3.gz$Z 
    ln -sf $S OpenFileChnl.3.gz$Z Tcl_RegisterChannel.3.gz$Z 
    ln -sf $S OpenFileChnl.3.gz$Z Tcl_UnregisterChannel.3.gz$Z 
    ln -sf $S OpenFileChnl.3.gz$Z Tcl_DetachChannel.3.gz$Z 
    ln -sf $S OpenFileChnl.3.gz$Z Tcl_IsStandardChannel.3.gz$Z 
    ln -sf $S OpenFileChnl.3.gz$Z Tcl_Close.3.gz$Z 
    ln -sf $S OpenFileChnl.3.gz$Z Tcl_ReadChars.3.gz$Z 
    ln -sf $S OpenFileChnl.3.gz$Z Tcl_Read.3.gz$Z 
    ln -sf $S OpenFileChnl.3.gz$Z Tcl_GetsObj.3.gz$Z 
    ln -sf $S OpenFileChnl.3.gz$Z Tcl_Gets.3.gz$Z 
    ln -sf $S OpenFileChnl.3.gz$Z Tcl_WriteObj.3.gz$Z 
    ln -sf $S OpenFileChnl.3.gz$Z Tcl_WriteChars.3.gz$Z 
    ln -sf $S OpenFileChnl.3.gz$Z Tcl_Write.3.gz$Z 
    ln -sf $S OpenFileChnl.3.gz$Z Tcl_Flush.3.gz$Z 
    ln -sf $S OpenFileChnl.3.gz$Z Tcl_Seek.3.gz$Z 
    ln -sf $S OpenFileChnl.3.gz$Z Tcl_Tell.3.gz$Z 
    ln -sf $S OpenFileChnl.3.gz$Z Tcl_GetChannelOption.3.gz$Z 
    ln -sf $S OpenFileChnl.3.gz$Z Tcl_SetChannelOption.3.gz$Z 
    ln -sf $S OpenFileChnl.3.gz$Z Tcl_Eof.3.gz$Z 
    ln -sf $S OpenFileChnl.3.gz$Z Tcl_InputBlocked.3.gz$Z 
    ln -sf $S OpenFileChnl.3.gz$Z Tcl_InputBuffered.3.gz$Z 
    ln -sf $S OpenFileChnl.3.gz$Z Tcl_OutputBuffered.3.gz$Z 
    ln -sf $S OpenFileChnl.3.gz$Z Tcl_Ungets.3.gz$Z 
    ln -sf $S OpenFileChnl.3.gz$Z Tcl_ReadRaw.3.gz$Z 
    ln -sf $S OpenFileChnl.3.gz$Z Tcl_WriteRaw.3.gz$Z 
fi
if test -r OpenTcp.3.gz; then
    rm -f OpenTcp.3.gz.*
    $ZIP OpenTcp.3.gz
    rm -f Tcl_OpenTcpClient.3.gz Tcl_OpenTcpClient.3.gz.* 
    rm -f Tcl_MakeTcpClientChannel.3.gz Tcl_MakeTcpClientChannel.3.gz.* 
    rm -f Tcl_OpenTcpServer.3.gz Tcl_OpenTcpServer.3.gz.* 
    ln -sf $S OpenTcp.3.gz$Z Tcl_OpenTcpClient.3.gz$Z 
    ln -sf $S OpenTcp.3.gz$Z Tcl_MakeTcpClientChannel.3.gz$Z 
    ln -sf $S OpenTcp.3.gz$Z Tcl_OpenTcpServer.3.gz$Z 
fi
if test -r Panic.3.gz; then
    rm -f Panic.3.gz.*
    $ZIP Panic.3.gz
    rm -f Tcl_Panic.3.gz Tcl_Panic.3.gz.* 
    rm -f Tcl_PanicVA.3.gz Tcl_PanicVA.3.gz.* 
    rm -f Tcl_SetPanicProc.3.gz Tcl_SetPanicProc.3.gz.* 
    if test "${CASEINSENSITIVEFS:-}" != "1"; then rm -f panic.3.gz panic.3.gz.* ; fi
    rm -f panicVA.3.gz panicVA.3.gz.* 
    ln -sf $S Panic.3.gz$Z Tcl_Panic.3.gz$Z 
    ln -sf $S Panic.3.gz$Z Tcl_PanicVA.3.gz$Z 
    ln -sf $S Panic.3.gz$Z Tcl_SetPanicProc.3.gz$Z 
    if test "${CASEINSENSITIVEFS:-}" != "1"; then ln -sf $S Panic.3.gz$Z panic.3.gz$Z ; fi
    ln -sf $S Panic.3.gz$Z panicVA.3.gz$Z 
fi
if test -r ParseCmd.3.gz; then
    rm -f ParseCmd.3.gz.*
    $ZIP ParseCmd.3.gz
    rm -f Tcl_ParseCommand.3.gz Tcl_ParseCommand.3.gz.* 
    rm -f Tcl_ParseExpr.3.gz Tcl_ParseExpr.3.gz.* 
    rm -f Tcl_ParseBraces.3.gz Tcl_ParseBraces.3.gz.* 
    rm -f Tcl_ParseQuotedString.3.gz Tcl_ParseQuotedString.3.gz.* 
    rm -f Tcl_ParseVarName.3.gz Tcl_ParseVarName.3.gz.* 
    rm -f Tcl_ParseVar.3.gz Tcl_ParseVar.3.gz.* 
    rm -f Tcl_FreeParse.3.gz Tcl_FreeParse.3.gz.* 
    rm -f Tcl_EvalTokens.3.gz Tcl_EvalTokens.3.gz.* 
    rm -f Tcl_EvalTokensStandard.3.gz Tcl_EvalTokensStandard.3.gz.* 
    ln -sf $S ParseCmd.3.gz$Z Tcl_ParseCommand.3.gz$Z 
    ln -sf $S ParseCmd.3.gz$Z Tcl_ParseExpr.3.gz$Z 
    ln -sf $S ParseCmd.3.gz$Z Tcl_ParseBraces.3.gz$Z 
    ln -sf $S ParseCmd.3.gz$Z Tcl_ParseQuotedString.3.gz$Z 
    ln -sf $S ParseCmd.3.gz$Z Tcl_ParseVarName.3.gz$Z 
    ln -sf $S ParseCmd.3.gz$Z Tcl_ParseVar.3.gz$Z 
    ln -sf $S ParseCmd.3.gz$Z Tcl_FreeParse.3.gz$Z 
    ln -sf $S ParseCmd.3.gz$Z Tcl_EvalTokens.3.gz$Z 
    ln -sf $S ParseCmd.3.gz$Z Tcl_EvalTokensStandard.3.gz$Z 
fi
if test -r PkgRequire.3.gz; then
    rm -f PkgRequire.3.gz.*
    $ZIP PkgRequire.3.gz
    rm -f Tcl_PkgRequire.3.gz Tcl_PkgRequire.3.gz.* 
    rm -f Tcl_PkgRequireEx.3.gz Tcl_PkgRequireEx.3.gz.* 
    rm -f Tcl_PkgPresent.3.gz Tcl_PkgPresent.3.gz.* 
    rm -f Tcl_PkgPresentEx.3.gz Tcl_PkgPresentEx.3.gz.* 
    rm -f Tcl_PkgProvide.3.gz Tcl_PkgProvide.3.gz.* 
    rm -f Tcl_PkgProvideEx.3.gz Tcl_PkgProvideEx.3.gz.* 
    ln -sf $S PkgRequire.3.gz$Z Tcl_PkgRequire.3.gz$Z 
    ln -sf $S PkgRequire.3.gz$Z Tcl_PkgRequireEx.3.gz$Z 
    ln -sf $S PkgRequire.3.gz$Z Tcl_PkgPresent.3.gz$Z 
    ln -sf $S PkgRequire.3.gz$Z Tcl_PkgPresentEx.3.gz$Z 
    ln -sf $S PkgRequire.3.gz$Z Tcl_PkgProvide.3.gz$Z 
    ln -sf $S PkgRequire.3.gz$Z Tcl_PkgProvideEx.3.gz$Z 
fi
if test -r Preserve.3.gz; then
    rm -f Preserve.3.gz.*
    $ZIP Preserve.3.gz
    rm -f Tcl_Preserve.3.gz Tcl_Preserve.3.gz.* 
    rm -f Tcl_Release.3.gz Tcl_Release.3.gz.* 
    rm -f Tcl_EventuallyFree.3.gz Tcl_EventuallyFree.3.gz.* 
    ln -sf $S Preserve.3.gz$Z Tcl_Preserve.3.gz$Z 
    ln -sf $S Preserve.3.gz$Z Tcl_Release.3.gz$Z 
    ln -sf $S Preserve.3.gz$Z Tcl_EventuallyFree.3.gz$Z 
fi
if test -r PrintDbl.3.gz; then
    rm -f PrintDbl.3.gz.*
    $ZIP PrintDbl.3.gz
    rm -f Tcl_PrintDouble.3.gz Tcl_PrintDouble.3.gz.* 
    ln -sf $S PrintDbl.3.gz$Z Tcl_PrintDouble.3.gz$Z 
fi
if test -r RecEvalObj.3.gz; then
    rm -f RecEvalObj.3.gz.*
    $ZIP RecEvalObj.3.gz
    rm -f Tcl_RecordAndEvalObj.3.gz Tcl_RecordAndEvalObj.3.gz.* 
    ln -sf $S RecEvalObj.3.gz$Z Tcl_RecordAndEvalObj.3.gz$Z 
fi
if test -r RecordEval.3.gz; then
    rm -f RecordEval.3.gz.*
    $ZIP RecordEval.3.gz
    rm -f Tcl_RecordAndEval.3.gz Tcl_RecordAndEval.3.gz.* 
    ln -sf $S RecordEval.3.gz$Z Tcl_RecordAndEval.3.gz$Z 
fi
if test -r RegExp.3.gz; then
    rm -f RegExp.3.gz.*
    $ZIP RegExp.3.gz
    rm -f Tcl_RegExpMatch.3.gz Tcl_RegExpMatch.3.gz.* 
    rm -f Tcl_RegExpCompile.3.gz Tcl_RegExpCompile.3.gz.* 
    rm -f Tcl_RegExpExec.3.gz Tcl_RegExpExec.3.gz.* 
    rm -f Tcl_RegExpRange.3.gz Tcl_RegExpRange.3.gz.* 
    rm -f Tcl_GetRegExpFromObj.3.gz Tcl_GetRegExpFromObj.3.gz.* 
    rm -f Tcl_RegExpMatchObj.3.gz Tcl_RegExpMatchObj.3.gz.* 
    rm -f Tcl_RegExpExecObj.3.gz Tcl_RegExpExecObj.3.gz.* 
    rm -f Tcl_RegExpGetInfo.3.gz Tcl_RegExpGetInfo.3.gz.* 
    ln -sf $S RegExp.3.gz$Z Tcl_RegExpMatch.3.gz$Z 
    ln -sf $S RegExp.3.gz$Z Tcl_RegExpCompile.3.gz$Z 
    ln -sf $S RegExp.3.gz$Z Tcl_RegExpExec.3.gz$Z 
    ln -sf $S RegExp.3.gz$Z Tcl_RegExpRange.3.gz$Z 
    ln -sf $S RegExp.3.gz$Z Tcl_GetRegExpFromObj.3.gz$Z 
    ln -sf $S RegExp.3.gz$Z Tcl_RegExpMatchObj.3.gz$Z 
    ln -sf $S RegExp.3.gz$Z Tcl_RegExpExecObj.3.gz$Z 
    ln -sf $S RegExp.3.gz$Z Tcl_RegExpGetInfo.3.gz$Z 
fi
if test -r SaveResult.3.gz; then
    rm -f SaveResult.3.gz.*
    $ZIP SaveResult.3.gz
    rm -f Tcl_SaveResult.3.gz Tcl_SaveResult.3.gz.* 
    rm -f Tcl_RestoreResult.3.gz Tcl_RestoreResult.3.gz.* 
    rm -f Tcl_DiscardResult.3.gz Tcl_DiscardResult.3.gz.* 
    ln -sf $S SaveResult.3.gz$Z Tcl_SaveResult.3.gz$Z 
    ln -sf $S SaveResult.3.gz$Z Tcl_RestoreResult.3.gz$Z 
    ln -sf $S SaveResult.3.gz$Z Tcl_DiscardResult.3.gz$Z 
fi
if test -r SetErrno.3.gz; then
    rm -f SetErrno.3.gz.*
    $ZIP SetErrno.3.gz
    rm -f Tcl_SetErrno.3.gz Tcl_SetErrno.3.gz.* 
    rm -f Tcl_GetErrno.3.gz Tcl_GetErrno.3.gz.* 
    rm -f Tcl_ErrnoId.3.gz Tcl_ErrnoId.3.gz.* 
    rm -f Tcl_ErrnoMsg.3.gz Tcl_ErrnoMsg.3.gz.* 
    ln -sf $S SetErrno.3.gz$Z Tcl_SetErrno.3.gz$Z 
    ln -sf $S SetErrno.3.gz$Z Tcl_GetErrno.3.gz$Z 
    ln -sf $S SetErrno.3.gz$Z Tcl_ErrnoId.3.gz$Z 
    ln -sf $S SetErrno.3.gz$Z Tcl_ErrnoMsg.3.gz$Z 
fi
if test -r SetRecLmt.3.gz; then
    rm -f SetRecLmt.3.gz.*
    $ZIP SetRecLmt.3.gz
    rm -f Tcl_SetRecursionLimit.3.gz Tcl_SetRecursionLimit.3.gz.* 
    ln -sf $S SetRecLmt.3.gz$Z Tcl_SetRecursionLimit.3.gz$Z 
fi
if test -r SetResult.3.gz; then
    rm -f SetResult.3.gz.*
    $ZIP SetResult.3.gz
    rm -f Tcl_SetObjResult.3.gz Tcl_SetObjResult.3.gz.* 
    rm -f Tcl_GetObjResult.3.gz Tcl_GetObjResult.3.gz.* 
    rm -f Tcl_SetResult.3.gz Tcl_SetResult.3.gz.* 
    rm -f Tcl_GetStringResult.3.gz Tcl_GetStringResult.3.gz.* 
    rm -f Tcl_AppendResult.3.gz Tcl_AppendResult.3.gz.* 
    rm -f Tcl_AppendResultVA.3.gz Tcl_AppendResultVA.3.gz.* 
    rm -f Tcl_AppendElement.3.gz Tcl_AppendElement.3.gz.* 
    rm -f Tcl_ResetResult.3.gz Tcl_ResetResult.3.gz.* 
    rm -f Tcl_FreeResult.3.gz Tcl_FreeResult.3.gz.* 
    ln -sf $S SetResult.3.gz$Z Tcl_SetObjResult.3.gz$Z 
    ln -sf $S SetResult.3.gz$Z Tcl_GetObjResult.3.gz$Z 
    ln -sf $S SetResult.3.gz$Z Tcl_SetResult.3.gz$Z 
    ln -sf $S SetResult.3.gz$Z Tcl_GetStringResult.3.gz$Z 
    ln -sf $S SetResult.3.gz$Z Tcl_AppendResult.3.gz$Z 
    ln -sf $S SetResult.3.gz$Z Tcl_AppendResultVA.3.gz$Z 
    ln -sf $S SetResult.3.gz$Z Tcl_AppendElement.3.gz$Z 
    ln -sf $S SetResult.3.gz$Z Tcl_ResetResult.3.gz$Z 
    ln -sf $S SetResult.3.gz$Z Tcl_FreeResult.3.gz$Z 
fi
if test -r SetVar.3.gz; then
    rm -f SetVar.3.gz.*
    $ZIP SetVar.3.gz
    rm -f Tcl_SetVar2Ex.3.gz Tcl_SetVar2Ex.3.gz.* 
    rm -f Tcl_SetVar.3.gz Tcl_SetVar.3.gz.* 
    rm -f Tcl_SetVar2.3.gz Tcl_SetVar2.3.gz.* 
    rm -f Tcl_ObjSetVar2.3.gz Tcl_ObjSetVar2.3.gz.* 
    rm -f Tcl_GetVar2Ex.3.gz Tcl_GetVar2Ex.3.gz.* 
    rm -f Tcl_GetVar.3.gz Tcl_GetVar.3.gz.* 
    rm -f Tcl_GetVar2.3.gz Tcl_GetVar2.3.gz.* 
    rm -f Tcl_ObjGetVar2.3.gz Tcl_ObjGetVar2.3.gz.* 
    rm -f Tcl_UnsetVar.3.gz Tcl_UnsetVar.3.gz.* 
    rm -f Tcl_UnsetVar2.3.gz Tcl_UnsetVar2.3.gz.* 
    ln -sf $S SetVar.3.gz$Z Tcl_SetVar2Ex.3.gz$Z 
    ln -sf $S SetVar.3.gz$Z Tcl_SetVar.3.gz$Z 
    ln -sf $S SetVar.3.gz$Z Tcl_SetVar2.3.gz$Z 
    ln -sf $S SetVar.3.gz$Z Tcl_ObjSetVar2.3.gz$Z 
    ln -sf $S SetVar.3.gz$Z Tcl_GetVar2Ex.3.gz$Z 
    ln -sf $S SetVar.3.gz$Z Tcl_GetVar.3.gz$Z 
    ln -sf $S SetVar.3.gz$Z Tcl_GetVar2.3.gz$Z 
    ln -sf $S SetVar.3.gz$Z Tcl_ObjGetVar2.3.gz$Z 
    ln -sf $S SetVar.3.gz$Z Tcl_UnsetVar.3.gz$Z 
    ln -sf $S SetVar.3.gz$Z Tcl_UnsetVar2.3.gz$Z 
fi
if test -r Signal.3.gz; then
    rm -f Signal.3.gz.*
    $ZIP Signal.3.gz
    rm -f Tcl_SignalId.3.gz Tcl_SignalId.3.gz.* 
    rm -f Tcl_SignalMsg.3.gz Tcl_SignalMsg.3.gz.* 
    ln -sf $S Signal.3.gz$Z Tcl_SignalId.3.gz$Z 
    ln -sf $S Signal.3.gz$Z Tcl_SignalMsg.3.gz$Z 
fi
if test -r Sleep.3.gz; then
    rm -f Sleep.3.gz.*
    $ZIP Sleep.3.gz
    rm -f Tcl_Sleep.3.gz Tcl_Sleep.3.gz.* 
    ln -sf $S Sleep.3.gz$Z Tcl_Sleep.3.gz$Z 
fi
if test -r SourceRCFile.3.gz; then
    rm -f SourceRCFile.3.gz.*
    $ZIP SourceRCFile.3.gz
    rm -f Tcl_SourceRCFile.3.gz Tcl_SourceRCFile.3.gz.* 
    ln -sf $S SourceRCFile.3.gz$Z Tcl_SourceRCFile.3.gz$Z 
fi
if test -r SplitList.3.gz; then
    rm -f SplitList.3.gz.*
    $ZIP SplitList.3.gz
    rm -f Tcl_SplitList.3.gz Tcl_SplitList.3.gz.* 
    rm -f Tcl_Merge.3.gz Tcl_Merge.3.gz.* 
    rm -f Tcl_ScanElement.3.gz Tcl_ScanElement.3.gz.* 
    rm -f Tcl_ConvertElement.3.gz Tcl_ConvertElement.3.gz.* 
    rm -f Tcl_ScanCountedElement.3.gz Tcl_ScanCountedElement.3.gz.* 
    rm -f Tcl_ConvertCountedElement.3.gz Tcl_ConvertCountedElement.3.gz.* 
    ln -sf $S SplitList.3.gz$Z Tcl_SplitList.3.gz$Z 
    ln -sf $S SplitList.3.gz$Z Tcl_Merge.3.gz$Z 
    ln -sf $S SplitList.3.gz$Z Tcl_ScanElement.3.gz$Z 
    ln -sf $S SplitList.3.gz$Z Tcl_ConvertElement.3.gz$Z 
    ln -sf $S SplitList.3.gz$Z Tcl_ScanCountedElement.3.gz$Z 
    ln -sf $S SplitList.3.gz$Z Tcl_ConvertCountedElement.3.gz$Z 
fi
if test -r SplitPath.3.gz; then
    rm -f SplitPath.3.gz.*
    $ZIP SplitPath.3.gz
    rm -f Tcl_SplitPath.3.gz Tcl_SplitPath.3.gz.* 
    rm -f Tcl_JoinPath.3.gz Tcl_JoinPath.3.gz.* 
    rm -f Tcl_GetPathType.3.gz Tcl_GetPathType.3.gz.* 
    ln -sf $S SplitPath.3.gz$Z Tcl_SplitPath.3.gz$Z 
    ln -sf $S SplitPath.3.gz$Z Tcl_JoinPath.3.gz$Z 
    ln -sf $S SplitPath.3.gz$Z Tcl_GetPathType.3.gz$Z 
fi
if test -r StaticPkg.3.gz; then
    rm -f StaticPkg.3.gz.*
    $ZIP StaticPkg.3.gz
    rm -f Tcl_StaticPackage.3.gz Tcl_StaticPackage.3.gz.* 
    ln -sf $S StaticPkg.3.gz$Z Tcl_StaticPackage.3.gz$Z 
fi
if test -r StdChannels.3.gz; then
    rm -f StdChannels.3.gz.*
    $ZIP StdChannels.3.gz
    rm -f Tcl_StandardChannels.3.gz Tcl_StandardChannels.3.gz.* 
    ln -sf $S StdChannels.3.gz$Z Tcl_StandardChannels.3.gz$Z 
fi
if test -r StrMatch.3.gz; then
    rm -f StrMatch.3.gz.*
    $ZIP StrMatch.3.gz
    rm -f Tcl_StringMatch.3.gz Tcl_StringMatch.3.gz.* 
    rm -f Tcl_StringCaseMatch.3.gz Tcl_StringCaseMatch.3.gz.* 
    ln -sf $S StrMatch.3.gz$Z Tcl_StringMatch.3.gz$Z 
    ln -sf $S StrMatch.3.gz$Z Tcl_StringCaseMatch.3.gz$Z 
fi
if test -r StringObj.3.gz; then
    rm -f StringObj.3.gz.*
    $ZIP StringObj.3.gz
    rm -f Tcl_NewStringObj.3.gz Tcl_NewStringObj.3.gz.* 
    rm -f Tcl_NewUnicodeObj.3.gz Tcl_NewUnicodeObj.3.gz.* 
    rm -f Tcl_SetStringObj.3.gz Tcl_SetStringObj.3.gz.* 
    rm -f Tcl_SetUnicodeObj.3.gz Tcl_SetUnicodeObj.3.gz.* 
    rm -f Tcl_GetStringFromObj.3.gz Tcl_GetStringFromObj.3.gz.* 
    rm -f Tcl_GetString.3.gz Tcl_GetString.3.gz.* 
    rm -f Tcl_GetUnicodeFromObj.3.gz Tcl_GetUnicodeFromObj.3.gz.* 
    rm -f Tcl_GetUnicode.3.gz Tcl_GetUnicode.3.gz.* 
    rm -f Tcl_GetUniChar.3.gz Tcl_GetUniChar.3.gz.* 
    rm -f Tcl_GetCharLength.3.gz Tcl_GetCharLength.3.gz.* 
    rm -f Tcl_GetRange.3.gz Tcl_GetRange.3.gz.* 
    rm -f Tcl_AppendToObj.3.gz Tcl_AppendToObj.3.gz.* 
    rm -f Tcl_AppendUnicodeToObj.3.gz Tcl_AppendUnicodeToObj.3.gz.* 
    rm -f Tcl_AppendStringsToObj.3.gz Tcl_AppendStringsToObj.3.gz.* 
    rm -f Tcl_AppendStringsToObjVA.3.gz Tcl_AppendStringsToObjVA.3.gz.* 
    rm -f Tcl_AppendObjToObj.3.gz Tcl_AppendObjToObj.3.gz.* 
    rm -f Tcl_SetObjLength.3.gz Tcl_SetObjLength.3.gz.* 
    rm -f Tcl_ConcatObj.3.gz Tcl_ConcatObj.3.gz.* 
    rm -f Tcl_AttemptSetObjLength.3.gz Tcl_AttemptSetObjLength.3.gz.* 
    ln -sf $S StringObj.3.gz$Z Tcl_NewStringObj.3.gz$Z 
    ln -sf $S StringObj.3.gz$Z Tcl_NewUnicodeObj.3.gz$Z 
    ln -sf $S StringObj.3.gz$Z Tcl_SetStringObj.3.gz$Z 
    ln -sf $S StringObj.3.gz$Z Tcl_SetUnicodeObj.3.gz$Z 
    ln -sf $S StringObj.3.gz$Z Tcl_GetStringFromObj.3.gz$Z 
    ln -sf $S StringObj.3.gz$Z Tcl_GetString.3.gz$Z 
    ln -sf $S StringObj.3.gz$Z Tcl_GetUnicodeFromObj.3.gz$Z 
    ln -sf $S StringObj.3.gz$Z Tcl_GetUnicode.3.gz$Z 
    ln -sf $S StringObj.3.gz$Z Tcl_GetUniChar.3.gz$Z 
    ln -sf $S StringObj.3.gz$Z Tcl_GetCharLength.3.gz$Z 
    ln -sf $S StringObj.3.gz$Z Tcl_GetRange.3.gz$Z 
    ln -sf $S StringObj.3.gz$Z Tcl_AppendToObj.3.gz$Z 
    ln -sf $S StringObj.3.gz$Z Tcl_AppendUnicodeToObj.3.gz$Z 
    ln -sf $S StringObj.3.gz$Z Tcl_AppendStringsToObj.3.gz$Z 
    ln -sf $S StringObj.3.gz$Z Tcl_AppendStringsToObjVA.3.gz$Z 
    ln -sf $S StringObj.3.gz$Z Tcl_AppendObjToObj.3.gz$Z 
    ln -sf $S StringObj.3.gz$Z Tcl_SetObjLength.3.gz$Z 
    ln -sf $S StringObj.3.gz$Z Tcl_ConcatObj.3.gz$Z 
    ln -sf $S StringObj.3.gz$Z Tcl_AttemptSetObjLength.3.gz$Z 
fi
if test -r SubstObj.3.gz; then
    rm -f SubstObj.3.gz.*
    $ZIP SubstObj.3.gz
    rm -f Tcl_SubstObj.3.gz Tcl_SubstObj.3.gz.* 
    ln -sf $S SubstObj.3.gz$Z Tcl_SubstObj.3.gz$Z 
fi
if test -r TCL_MEM_DEBUG.3.gz; then
    rm -f TCL_MEM_DEBUG.3.gz.*
    $ZIP TCL_MEM_DEBUG.3.gz
fi
if test -r Tcl.n.gz; then
    rm -f Tcl.n.gz.*
    $ZIP Tcl.n.gz
fi
if test -r Tcl_Main.3.gz; then
    rm -f Tcl_Main.3.gz.*
    $ZIP Tcl_Main.3.gz
    rm -f Tcl_SetMainLoop.3.gz Tcl_SetMainLoop.3.gz.* 
    ln -sf $S Tcl_Main.3.gz$Z Tcl_SetMainLoop.3.gz$Z 
fi
if test -r Thread.3.gz; then
    rm -f Thread.3.gz.*
    $ZIP Thread.3.gz
    rm -f Tcl_ConditionNotify.3.gz Tcl_ConditionNotify.3.gz.* 
    rm -f Tcl_ConditionWait.3.gz Tcl_ConditionWait.3.gz.* 
    rm -f Tcl_ConditionFinalize.3.gz Tcl_ConditionFinalize.3.gz.* 
    rm -f Tcl_GetThreadData.3.gz Tcl_GetThreadData.3.gz.* 
    rm -f Tcl_MutexLock.3.gz Tcl_MutexLock.3.gz.* 
    rm -f Tcl_MutexUnlock.3.gz Tcl_MutexUnlock.3.gz.* 
    rm -f Tcl_MutexFinalize.3.gz Tcl_MutexFinalize.3.gz.* 
    rm -f Tcl_CreateThread.3.gz Tcl_CreateThread.3.gz.* 
    rm -f Tcl_JoinThread.3.gz Tcl_JoinThread.3.gz.* 
    ln -sf $S Thread.3.gz$Z Tcl_ConditionNotify.3.gz$Z 
    ln -sf $S Thread.3.gz$Z Tcl_ConditionWait.3.gz$Z 
    ln -sf $S Thread.3.gz$Z Tcl_ConditionFinalize.3.gz$Z 
    ln -sf $S Thread.3.gz$Z Tcl_GetThreadData.3.gz$Z 
    ln -sf $S Thread.3.gz$Z Tcl_MutexLock.3.gz$Z 
    ln -sf $S Thread.3.gz$Z Tcl_MutexUnlock.3.gz$Z 
    ln -sf $S Thread.3.gz$Z Tcl_MutexFinalize.3.gz$Z 
    ln -sf $S Thread.3.gz$Z Tcl_CreateThread.3.gz$Z 
    ln -sf $S Thread.3.gz$Z Tcl_JoinThread.3.gz$Z 
fi
if test -r ToUpper.3.gz; then
    rm -f ToUpper.3.gz.*
    $ZIP ToUpper.3.gz
    rm -f Tcl_UniCharToUpper.3.gz Tcl_UniCharToUpper.3.gz.* 
    rm -f Tcl_UniCharToLower.3.gz Tcl_UniCharToLower.3.gz.* 
    rm -f Tcl_UniCharToTitle.3.gz Tcl_UniCharToTitle.3.gz.* 
    rm -f Tcl_UtfToUpper.3.gz Tcl_UtfToUpper.3.gz.* 
    rm -f Tcl_UtfToLower.3.gz Tcl_UtfToLower.3.gz.* 
    rm -f Tcl_UtfToTitle.3.gz Tcl_UtfToTitle.3.gz.* 
    ln -sf $S ToUpper.3.gz$Z Tcl_UniCharToUpper.3.gz$Z 
    ln -sf $S ToUpper.3.gz$Z Tcl_UniCharToLower.3.gz$Z 
    ln -sf $S ToUpper.3.gz$Z Tcl_UniCharToTitle.3.gz$Z 
    ln -sf $S ToUpper.3.gz$Z Tcl_UtfToUpper.3.gz$Z 
    ln -sf $S ToUpper.3.gz$Z Tcl_UtfToLower.3.gz$Z 
    ln -sf $S ToUpper.3.gz$Z Tcl_UtfToTitle.3.gz$Z 
fi
if test -r TraceCmd.3.gz; then
    rm -f TraceCmd.3.gz.*
    $ZIP TraceCmd.3.gz
    rm -f Tcl_CommandTraceInfo.3.gz Tcl_CommandTraceInfo.3.gz.* 
    rm -f Tcl_TraceCommand.3.gz Tcl_TraceCommand.3.gz.* 
    rm -f Tcl_UntraceCommand.3.gz Tcl_UntraceCommand.3.gz.* 
    ln -sf $S TraceCmd.3.gz$Z Tcl_CommandTraceInfo.3.gz$Z 
    ln -sf $S TraceCmd.3.gz$Z Tcl_TraceCommand.3.gz$Z 
    ln -sf $S TraceCmd.3.gz$Z Tcl_UntraceCommand.3.gz$Z 
fi
if test -r TraceVar.3.gz; then
    rm -f TraceVar.3.gz.*
    $ZIP TraceVar.3.gz
    rm -f Tcl_TraceVar.3.gz Tcl_TraceVar.3.gz.* 
    rm -f Tcl_TraceVar2.3.gz Tcl_TraceVar2.3.gz.* 
    rm -f Tcl_UntraceVar.3.gz Tcl_UntraceVar.3.gz.* 
    rm -f Tcl_UntraceVar2.3.gz Tcl_UntraceVar2.3.gz.* 
    rm -f Tcl_VarTraceInfo.3.gz Tcl_VarTraceInfo.3.gz.* 
    rm -f Tcl_VarTraceInfo2.3.gz Tcl_VarTraceInfo2.3.gz.* 
    ln -sf $S TraceVar.3.gz$Z Tcl_TraceVar.3.gz$Z 
    ln -sf $S TraceVar.3.gz$Z Tcl_TraceVar2.3.gz$Z 
    ln -sf $S TraceVar.3.gz$Z Tcl_UntraceVar.3.gz$Z 
    ln -sf $S TraceVar.3.gz$Z Tcl_UntraceVar2.3.gz$Z 
    ln -sf $S TraceVar.3.gz$Z Tcl_VarTraceInfo.3.gz$Z 
    ln -sf $S TraceVar.3.gz$Z Tcl_VarTraceInfo2.3.gz$Z 
fi
if test -r Translate.3.gz; then
    rm -f Translate.3.gz.*
    $ZIP Translate.3.gz
    rm -f Tcl_TranslateFileName.3.gz Tcl_TranslateFileName.3.gz.* 
    ln -sf $S Translate.3.gz$Z Tcl_TranslateFileName.3.gz$Z 
fi
if test -r UniCharIsAlpha.3.gz; then
    rm -f UniCharIsAlpha.3.gz.*
    $ZIP UniCharIsAlpha.3.gz
    rm -f Tcl_UniCharIsAlnum.3.gz Tcl_UniCharIsAlnum.3.gz.* 
    rm -f Tcl_UniCharIsAlpha.3.gz Tcl_UniCharIsAlpha.3.gz.* 
    rm -f Tcl_UniCharIsControl.3.gz Tcl_UniCharIsControl.3.gz.* 
    rm -f Tcl_UniCharIsDigit.3.gz Tcl_UniCharIsDigit.3.gz.* 
    rm -f Tcl_UniCharIsGraph.3.gz Tcl_UniCharIsGraph.3.gz.* 
    rm -f Tcl_UniCharIsLower.3.gz Tcl_UniCharIsLower.3.gz.* 
    rm -f Tcl_UniCharIsPrint.3.gz Tcl_UniCharIsPrint.3.gz.* 
    rm -f Tcl_UniCharIsPunct.3.gz Tcl_UniCharIsPunct.3.gz.* 
    rm -f Tcl_UniCharIsSpace.3.gz Tcl_UniCharIsSpace.3.gz.* 
    rm -f Tcl_UniCharIsUpper.3.gz Tcl_UniCharIsUpper.3.gz.* 
    rm -f Tcl_UniCharIsWordChar.3.gz Tcl_UniCharIsWordChar.3.gz.* 
    ln -sf $S UniCharIsAlpha.3.gz$Z Tcl_UniCharIsAlnum.3.gz$Z 
    ln -sf $S UniCharIsAlpha.3.gz$Z Tcl_UniCharIsAlpha.3.gz$Z 
    ln -sf $S UniCharIsAlpha.3.gz$Z Tcl_UniCharIsControl.3.gz$Z 
    ln -sf $S UniCharIsAlpha.3.gz$Z Tcl_UniCharIsDigit.3.gz$Z 
    ln -sf $S UniCharIsAlpha.3.gz$Z Tcl_UniCharIsGraph.3.gz$Z 
    ln -sf $S UniCharIsAlpha.3.gz$Z Tcl_UniCharIsLower.3.gz$Z 
    ln -sf $S UniCharIsAlpha.3.gz$Z Tcl_UniCharIsPrint.3.gz$Z 
    ln -sf $S UniCharIsAlpha.3.gz$Z Tcl_UniCharIsPunct.3.gz$Z 
    ln -sf $S UniCharIsAlpha.3.gz$Z Tcl_UniCharIsSpace.3.gz$Z 
    ln -sf $S UniCharIsAlpha.3.gz$Z Tcl_UniCharIsUpper.3.gz$Z 
    ln -sf $S UniCharIsAlpha.3.gz$Z Tcl_UniCharIsWordChar.3.gz$Z 
fi
if test -r UpVar.3.gz; then
    rm -f UpVar.3.gz.*
    $ZIP UpVar.3.gz
    rm -f Tcl_UpVar.3.gz Tcl_UpVar.3.gz.* 
    rm -f Tcl_UpVar2.3.gz Tcl_UpVar2.3.gz.* 
    ln -sf $S UpVar.3.gz$Z Tcl_UpVar.3.gz$Z 
    ln -sf $S UpVar.3.gz$Z Tcl_UpVar2.3.gz$Z 
fi
if test -r Utf.3.gz; then
    rm -f Utf.3.gz.*
    $ZIP Utf.3.gz
    rm -f Tcl_UniChar.3.gz Tcl_UniChar.3.gz.* 
    rm -f Tcl_UniCharCaseMatch.3.gz Tcl_UniCharCaseMatch.3.gz.* 
    rm -f Tcl_UniCharNcasecmp.3.gz Tcl_UniCharNcasecmp.3.gz.* 
    rm -f Tcl_UniCharToUtf.3.gz Tcl_UniCharToUtf.3.gz.* 
    rm -f Tcl_UtfToUniChar.3.gz Tcl_UtfToUniChar.3.gz.* 
    rm -f Tcl_UniCharToUtfDString.3.gz Tcl_UniCharToUtfDString.3.gz.* 
    rm -f Tcl_UtfToUniCharDString.3.gz Tcl_UtfToUniCharDString.3.gz.* 
    rm -f Tcl_UniCharLen.3.gz Tcl_UniCharLen.3.gz.* 
    rm -f Tcl_UniCharNcmp.3.gz Tcl_UniCharNcmp.3.gz.* 
    rm -f Tcl_UtfCharComplete.3.gz Tcl_UtfCharComplete.3.gz.* 
    rm -f Tcl_NumUtfChars.3.gz Tcl_NumUtfChars.3.gz.* 
    rm -f Tcl_UtfFindFirst.3.gz Tcl_UtfFindFirst.3.gz.* 
    rm -f Tcl_UtfFindLast.3.gz Tcl_UtfFindLast.3.gz.* 
    rm -f Tcl_UtfNext.3.gz Tcl_UtfNext.3.gz.* 
    rm -f Tcl_UtfPrev.3.gz Tcl_UtfPrev.3.gz.* 
    rm -f Tcl_UniCharAtIndex.3.gz Tcl_UniCharAtIndex.3.gz.* 
    rm -f Tcl_UtfAtIndex.3.gz Tcl_UtfAtIndex.3.gz.* 
    rm -f Tcl_UtfBackslash.3.gz Tcl_UtfBackslash.3.gz.* 
    ln -sf $S Utf.3.gz$Z Tcl_UniChar.3.gz$Z 
    ln -sf $S Utf.3.gz$Z Tcl_UniCharCaseMatch.3.gz$Z 
    ln -sf $S Utf.3.gz$Z Tcl_UniCharNcasecmp.3.gz$Z 
    ln -sf $S Utf.3.gz$Z Tcl_UniCharToUtf.3.gz$Z 
    ln -sf $S Utf.3.gz$Z Tcl_UtfToUniChar.3.gz$Z 
    ln -sf $S Utf.3.gz$Z Tcl_UniCharToUtfDString.3.gz$Z 
    ln -sf $S Utf.3.gz$Z Tcl_UtfToUniCharDString.3.gz$Z 
    ln -sf $S Utf.3.gz$Z Tcl_UniCharLen.3.gz$Z 
    ln -sf $S Utf.3.gz$Z Tcl_UniCharNcmp.3.gz$Z 
    ln -sf $S Utf.3.gz$Z Tcl_UtfCharComplete.3.gz$Z 
    ln -sf $S Utf.3.gz$Z Tcl_NumUtfChars.3.gz$Z 
    ln -sf $S Utf.3.gz$Z Tcl_UtfFindFirst.3.gz$Z 
    ln -sf $S Utf.3.gz$Z Tcl_UtfFindLast.3.gz$Z 
    ln -sf $S Utf.3.gz$Z Tcl_UtfNext.3.gz$Z 
    ln -sf $S Utf.3.gz$Z Tcl_UtfPrev.3.gz$Z 
    ln -sf $S Utf.3.gz$Z Tcl_UniCharAtIndex.3.gz$Z 
    ln -sf $S Utf.3.gz$Z Tcl_UtfAtIndex.3.gz$Z 
    ln -sf $S Utf.3.gz$Z Tcl_UtfBackslash.3.gz$Z 
fi
if test -r WrongNumArgs.3.gz; then
    rm -f WrongNumArgs.3.gz.*
    $ZIP WrongNumArgs.3.gz
    rm -f Tcl_WrongNumArgs.3.gz Tcl_WrongNumArgs.3.gz.* 
    ln -sf $S WrongNumArgs.3.gz$Z Tcl_WrongNumArgs.3.gz$Z 
fi
if test -r after.n.gz; then
    rm -f after.n.gz.*
    $ZIP after.n.gz
fi
if test -r append.n.gz; then
    rm -f append.n.gz.*
    $ZIP append.n.gz
fi
if test -r array.n.gz; then
    rm -f array.n.gz.*
    $ZIP array.n.gz
fi
if test -r bgerror.n.gz; then
    rm -f bgerror.n.gz.*
    $ZIP bgerror.n.gz
fi
if test -r binary.n.gz; then
    rm -f binary.n.gz.*
    $ZIP binary.n.gz
fi
if test -r break.n.gz; then
    rm -f break.n.gz.*
    $ZIP break.n.gz
fi
if test -r case.n.gz; then
    rm -f case.n.gz.*
    $ZIP case.n.gz
fi
if test -r catch.n.gz; then
    rm -f catch.n.gz.*
    $ZIP catch.n.gz
fi
if test -r cd.n.gz; then
    rm -f cd.n.gz.*
    $ZIP cd.n.gz
fi
if test -r clock.n.gz; then
    rm -f clock.n.gz.*
    $ZIP clock.n.gz
fi
if test -r close.n.gz; then
    rm -f close.n.gz.*
    $ZIP close.n.gz
fi
if test -r concat.n.gz; then
    rm -f concat.n.gz.*
    $ZIP concat.n.gz
fi
if test -r continue.n.gz; then
    rm -f continue.n.gz.*
    $ZIP continue.n.gz
fi
if test -r dde.n.gz; then
    rm -f dde.n.gz.*
    $ZIP dde.n.gz
fi
if test -r encoding.n.gz; then
    rm -f encoding.n.gz.*
    $ZIP encoding.n.gz
fi
if test -r eof.n.gz; then
    rm -f eof.n.gz.*
    $ZIP eof.n.gz
fi
if test -r error.n.gz; then
    rm -f error.n.gz.*
    $ZIP error.n.gz
fi
if test -r eval.n.gz; then
    rm -f eval.n.gz.*
    $ZIP eval.n.gz
fi
if test -r exec.n.gz; then
    rm -f exec.n.gz.*
    $ZIP exec.n.gz
fi
if test -r exit.n.gz; then
    rm -f exit.n.gz.*
    $ZIP exit.n.gz
fi
if test -r expr.n.gz; then
    rm -f expr.n.gz.*
    $ZIP expr.n.gz
fi
if test -r fblocked.n.gz; then
    rm -f fblocked.n.gz.*
    $ZIP fblocked.n.gz
fi
if test -r fconfigure.n.gz; then
    rm -f fconfigure.n.gz.*
    $ZIP fconfigure.n.gz
fi
if test -r fcopy.n.gz; then
    rm -f fcopy.n.gz.*
    $ZIP fcopy.n.gz
fi
if test -r file.n.gz; then
    rm -f file.n.gz.*
    $ZIP file.n.gz
fi
if test -r fileevent.n.gz; then
    rm -f fileevent.n.gz.*
    $ZIP fileevent.n.gz
fi
if test -r filename.n.gz; then
    rm -f filename.n.gz.*
    $ZIP filename.n.gz
fi
if test -r flush.n.gz; then
    rm -f flush.n.gz.*
    $ZIP flush.n.gz
fi
if test -r for.n.gz; then
    rm -f for.n.gz.*
    $ZIP for.n.gz
fi
if test -r foreach.n.gz; then
    rm -f foreach.n.gz.*
    $ZIP foreach.n.gz
fi
if test -r format.n.gz; then
    rm -f format.n.gz.*
    $ZIP format.n.gz
fi
if test -r gets.n.gz; then
    rm -f gets.n.gz.*
    $ZIP gets.n.gz
fi
if test -r glob.n.gz; then
    rm -f glob.n.gz.*
    $ZIP glob.n.gz
fi
if test -r global.n.gz; then
    rm -f global.n.gz.*
    $ZIP global.n.gz
fi
if test -r history.n.gz; then
    rm -f history.n.gz.*
    $ZIP history.n.gz
fi
if test -r http.n.gz; then
    rm -f http.n.gz.*
    $ZIP http.n.gz
fi
if test -r if.n.gz; then
    rm -f if.n.gz.*
    $ZIP if.n.gz
fi
if test -r incr.n.gz; then
    rm -f incr.n.gz.*
    $ZIP incr.n.gz
fi
if test -r info.n.gz; then
    rm -f info.n.gz.*
    $ZIP info.n.gz
fi
if test -r interp.n.gz; then
    rm -f interp.n.gz.*
    $ZIP interp.n.gz
fi
if test -r join.n.gz; then
    rm -f join.n.gz.*
    $ZIP join.n.gz
fi
if test -r lappend.n.gz; then
    rm -f lappend.n.gz.*
    $ZIP lappend.n.gz
fi
if test -r library.n.gz; then
    rm -f library.n.gz.*
    $ZIP library.n.gz
    rm -f auto_execok.n.gz auto_execok.n.gz.* 
    rm -f auto_import.n.gz auto_import.n.gz.* 
    rm -f auto_load.n.gz auto_load.n.gz.* 
    rm -f auto_mkindex.n.gz auto_mkindex.n.gz.* 
    rm -f auto_mkindex_old.n.gz auto_mkindex_old.n.gz.* 
    rm -f auto_qualify.n.gz auto_qualify.n.gz.* 
    rm -f auto_reset.n.gz auto_reset.n.gz.* 
    rm -f tcl_findLibrary.n.gz tcl_findLibrary.n.gz.* 
    rm -f parray.n.gz parray.n.gz.* 
    rm -f tcl_endOfWord.n.gz tcl_endOfWord.n.gz.* 
    rm -f tcl_startOfNextWord.n.gz tcl_startOfNextWord.n.gz.* 
    rm -f tcl_startOfPreviousWord.n.gz tcl_startOfPreviousWord.n.gz.* 
    rm -f tcl_wordBreakAfter.n.gz tcl_wordBreakAfter.n.gz.* 
    rm -f tcl_wordBreakBefore.n.gz tcl_wordBreakBefore.n.gz.* 
    ln -sf $S library.n.gz$Z auto_execok.n.gz$Z 
    ln -sf $S library.n.gz$Z auto_import.n.gz$Z 
    ln -sf $S library.n.gz$Z auto_load.n.gz$Z 
    ln -sf $S library.n.gz$Z auto_mkindex.n.gz$Z 
    ln -sf $S library.n.gz$Z auto_mkindex_old.n.gz$Z 
    ln -sf $S library.n.gz$Z auto_qualify.n.gz$Z 
    ln -sf $S library.n.gz$Z auto_reset.n.gz$Z 
    ln -sf $S library.n.gz$Z tcl_findLibrary.n.gz$Z 
    ln -sf $S library.n.gz$Z parray.n.gz$Z 
    ln -sf $S library.n.gz$Z tcl_endOfWord.n.gz$Z 
    ln -sf $S library.n.gz$Z tcl_startOfNextWord.n.gz$Z 
    ln -sf $S library.n.gz$Z tcl_startOfPreviousWord.n.gz$Z 
    ln -sf $S library.n.gz$Z tcl_wordBreakAfter.n.gz$Z 
    ln -sf $S library.n.gz$Z tcl_wordBreakBefore.n.gz$Z 
fi
if test -r lindex.n.gz; then
    rm -f lindex.n.gz.*
    $ZIP lindex.n.gz
fi
if test -r linsert.n.gz; then
    rm -f linsert.n.gz.*
    $ZIP linsert.n.gz
fi
if test -r list.n.gz; then
    rm -f list.n.gz.*
    $ZIP list.n.gz
fi
if test -r llength.n.gz; then
    rm -f llength.n.gz.*
    $ZIP llength.n.gz
fi
if test -r load.n.gz; then
    rm -f load.n.gz.*
    $ZIP load.n.gz
fi
if test -r lrange.n.gz; then
    rm -f lrange.n.gz.*
    $ZIP lrange.n.gz
fi
if test -r lreplace.n.gz; then
    rm -f lreplace.n.gz.*
    $ZIP lreplace.n.gz
fi
if test -r lsearch.n.gz; then
    rm -f lsearch.n.gz.*
    $ZIP lsearch.n.gz
fi
if test -r lset.n.gz; then
    rm -f lset.n.gz.*
    $ZIP lset.n.gz
fi
if test -r lsort.n.gz; then
    rm -f lsort.n.gz.*
    $ZIP lsort.n.gz
fi
if test -r memory.n.gz; then
    rm -f memory.n.gz.*
    $ZIP memory.n.gz
fi
if test -r msgcat.n.gz; then
    rm -f msgcat.n.gz.*
    $ZIP msgcat.n.gz
fi
if test -r namespace.n.gz; then
    rm -f namespace.n.gz.*
    $ZIP namespace.n.gz
fi
if test -r open.n.gz; then
    rm -f open.n.gz.*
    $ZIP open.n.gz
fi
if test -r package.n.gz; then
    rm -f package.n.gz.*
    $ZIP package.n.gz
fi
if test -r packagens.n.gz; then
    rm -f packagens.n.gz.*
    $ZIP packagens.n.gz
    rm -f pkg::create.n.gz pkg::create.n.gz.* 
    ln -sf $S packagens.n.gz$Z pkg::create.n.gz$Z 
fi
if test -r pid.n.gz; then
    rm -f pid.n.gz.*
    $ZIP pid.n.gz
fi
if test -r pkgMkIndex.n.gz; then
    rm -f pkgMkIndex.n.gz.*
    $ZIP pkgMkIndex.n.gz
    rm -f pkg_mkIndex.n.gz pkg_mkIndex.n.gz.* 
    ln -sf $S pkgMkIndex.n.gz$Z pkg_mkIndex.n.gz$Z 
fi
if test -r proc.n.gz; then
    rm -f proc.n.gz.*
    $ZIP proc.n.gz
fi
if test -r puts.n.gz; then
    rm -f puts.n.gz.*
    $ZIP puts.n.gz
fi
if test -r pwd.n.gz; then
    rm -f pwd.n.gz.*
    $ZIP pwd.n.gz
fi
if test -r re_syntax.n.gz; then
    rm -f re_syntax.n.gz.*
    $ZIP re_syntax.n.gz
fi
if test -r read.n.gz; then
    rm -f read.n.gz.*
    $ZIP read.n.gz
fi
if test -r regexp.n.gz; then
    rm -f regexp.n.gz.*
    $ZIP regexp.n.gz
fi
if test -r registry.n.gz; then
    rm -f registry.n.gz.*
    $ZIP registry.n.gz
fi
if test -r regsub.n.gz; then
    rm -f regsub.n.gz.*
    $ZIP regsub.n.gz
fi
if test -r rename.n.gz; then
    rm -f rename.n.gz.*
    $ZIP rename.n.gz
fi
if test -r resource.n.gz; then
    rm -f resource.n.gz.*
    $ZIP resource.n.gz
fi
if test -r return.n.gz; then
    rm -f return.n.gz.*
    $ZIP return.n.gz
fi
if test -r safe.n.gz; then
    rm -f safe.n.gz.*
    $ZIP safe.n.gz
    rm -f SafeBase.n.gz SafeBase.n.gz.* 
    ln -sf $S safe.n.gz$Z SafeBase.n.gz$Z 
fi
if test -r scan.n.gz; then
    rm -f scan.n.gz.*
    $ZIP scan.n.gz
fi
if test -r seek.n.gz; then
    rm -f seek.n.gz.*
    $ZIP seek.n.gz
fi
if test -r set.n.gz; then
    rm -f set.n.gz.*
    $ZIP set.n.gz
fi
if test -r socket.n.gz; then
    rm -f socket.n.gz.*
    $ZIP socket.n.gz
fi
if test -r source.n.gz; then
    rm -f source.n.gz.*
    $ZIP source.n.gz
fi
if test -r split.n.gz; then
    rm -f split.n.gz.*
    $ZIP split.n.gz
fi
if test -r string.n.gz; then
    rm -f string.n.gz.*
    $ZIP string.n.gz
fi
if test -r subst.n.gz; then
    rm -f subst.n.gz.*
    $ZIP subst.n.gz
fi
if test -r switch.n.gz; then
    rm -f switch.n.gz.*
    $ZIP switch.n.gz
fi
if test -r tclsh.1; then
    rm -f tclsh.1.*
    $ZIP tclsh.1
fi
if test -r tcltest.n.gz; then
    rm -f tcltest.n.gz.*
    $ZIP tcltest.n.gz
fi
if test -r tclvars.n.gz; then
    rm -f tclvars.n.gz.*
    $ZIP tclvars.n.gz
fi
if test -r tell.n.gz; then
    rm -f tell.n.gz.*
    $ZIP tell.n.gz
fi
if test -r time.n.gz; then
    rm -f time.n.gz.*
    $ZIP time.n.gz
fi
if test -r trace.n.gz; then
    rm -f trace.n.gz.*
    $ZIP trace.n.gz
fi
if test -r unknown.n.gz; then
    rm -f unknown.n.gz.*
    $ZIP unknown.n.gz
fi
if test -r unset.n.gz; then
    rm -f unset.n.gz.*
    $ZIP unset.n.gz
fi
if test -r update.n.gz; then
    rm -f update.n.gz.*
    $ZIP update.n.gz
fi
if test -r uplevel.n.gz; then
    rm -f uplevel.n.gz.*
    $ZIP uplevel.n.gz
fi
if test -r upvar.n.gz; then
    rm -f upvar.n.gz.*
    $ZIP upvar.n.gz
fi
if test -r variable.n.gz; then
    rm -f variable.n.gz.*
    $ZIP variable.n.gz
fi
if test -r vwait.n.gz; then
    rm -f vwait.n.gz.*
    $ZIP vwait.n.gz
fi
if test -r while.n.gz; then
    rm -f while.n.gz.*
    $ZIP while.n.gz
fi
exit 0
