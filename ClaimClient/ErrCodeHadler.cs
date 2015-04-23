using ClaimClient.ClaimServiceReference;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ClaimClient
{
    /// <summary>
    /// Обработчик ошибок. Выводит текстовое сообщение, зависимое от кода ошибки
    /// </summary>
    public static class ErrCodeHadler
    {
        public static string handle(OperationResult opResult)
        {
            switch (opResult.ErrCode)
            {
                case ErrorCode.InputDataFormat:
                    {
                        return Properties.Settings.Default.formatException;
                    }
                case ErrorCode.Internal:
                    {
                        return Properties.Settings.Default.serverError;
                    }
                default:
                    {
                        return Properties.Settings.Default.serverNotFound;
                    }
            }
        }
    }
}