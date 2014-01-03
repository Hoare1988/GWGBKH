package org.just.exception;

import java.io.Serializable;
import java.text.MessageFormat;
import java.util.MissingResourceException;

/**
 * ҵ���쳣����. ���д�������������Ϣ. �û�������쳣ʱ�ȿ���ֱ�Ӹ����������������Ϣ.
 * Ҳ����ֻ�����������������Ϣ����. ��ErrorCode=ORDER.LACK_INVENTORY
 * ,errorArg=without EJB ϵͳ���errors.properties�в�� ORDER.LACK_INVENTORY=Book
 * <{0}> lack of inventory ��󷵻ش�����ϢΪ Book <without EJB> lack of inventory.
 * 
 */
public class BusinessException extends RuntimeException implements Serializable
{

	/**
	 * ���л�ID��.
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * Ĭ�ϵĴ������.
	 */
	public static final String DEFAULT_ERROR_CODE = "UNKNOW_ERROR";
	

	/**
	 * �������,Ĭ��Ϊδ֪����.
	 */
	private String m_errorCode = DEFAULT_ERROR_CODE;
	private String m_errorType = DEFAULT_ERROR_CODE;

	/**
	 * ������Ϣ�еĲ���.
	 */
	private String[] m_errorArgs = null;

	/**
	 * ���ݴ�������Ϣ������error code,errorArgs�����.
	 */
	private String m_errorMessage = null;

	/**
	 * @return the errorMessage
	 */
	protected String getErrorMessage()
	{
		return m_errorMessage;
	}

	/**
	 * @param errorMessage
	 *            the errorMessage to set.
	 */
	protected void setErrorMessage(String errorMessage)
	{
		m_errorMessage = errorMessage;
	}

	/**
	 * @param errorCode
	 *            the errorCode to set.
	 */
	protected void setErrorCode(String errorCode)
	{
		m_errorCode = errorCode;
	}

	/**
	 * ������Ϣ��i18n ResourceBundle. Ĭ��Properties�ļ�������
	 * {@link Constants#ERROR_BUNDLE_KEY}
	 */
	// static private ResourceBundle rb =
	// ResourceBundle.getBundle(Constants.ERROR_BUNDLE_KEY);

	public BusinessException()
	{
		super();
		this.getMessage();
	}

	/**
	 * ������.
	 * 
	 * @param errorCode
	 *            �������
	 * @param errorArgs
	 *            �����ʽ������
	 */
	public BusinessException(String errorCode, String[] errorArgs)
	{
		super(errorCode);
		this.m_errorCode = errorCode;
		this.m_errorArgs = errorArgs;
	}

	/**
	 * .
	 * 
	 * @param errorMessage
	 * @param cause
	 */
	public BusinessException(String errorMessage, Throwable cause)
	{
		super(errorMessage, cause);
		this.m_errorMessage = errorMessage;
	}

	public BusinessException(String errorCode, String errorMessage)
	{
		super(errorCode);
		this.m_errorCode = errorCode;
		this.m_errorMessage = errorMessage;
	}
	
	public BusinessException(String errorCode,String errorType, String errorMessage)
	{
		super(errorCode);
		this.m_errorCode = errorCode;
		this.m_errorType = errorType;
		this.m_errorMessage = errorMessage;
	}

	public BusinessException(String errorCode, String[] errorArgs,
			Throwable cause)
	{
		super(errorCode, cause);
		this.m_errorCode = errorCode;
		this.m_errorArgs = errorArgs;
	}

	public BusinessException(String errorCode, String errorArg, Throwable cause)
	{
		super(cause);
		this.m_errorCode = errorCode;
		this.m_errorArgs = new String[] { errorArg };
	}

	public BusinessException(String errorMessage)
	{
		super(errorMessage);
		this.m_errorMessage = errorMessage;
	}

	/**
	 * ��ó�����Ϣ. ��ȡi18N properties�ļ���Error
	 * Code��Ӧ��message,����ϲ�����i18n�ĳ�����Ϣ.
	 */
	public String getMessage()
	{
		// ���errorMessage��Ϊ��,ֱ�ӷ��س�����Ϣ.
		if (m_errorMessage != null)
		{
			return m_errorMessage;
		}
		// ������errorCode��ѯProperties�ļ���ó�����Ϣ
		String message = null;
		try
		{
			// message = rb.getString(errorCode);

			// ��������Ϣ�еĲ�����뵽������Ϣ��
			if (m_errorArgs != null && message != null)
			{
				message = MessageFormat.format(message, (Object[]) m_errorArgs);
			}
			message += ", Error Code is: " + m_errorCode;
		}
		catch (MissingResourceException mse)
		{
			message = "ErrorCode is: " + m_errorCode
					+ ", but can't get the message of the Error Code";
		}
		return message;

	}
	
	protected void setErrorType(String errorType)
	{
		m_errorType = errorType;
	}
	public String getErrorType()
	{
		return m_errorType;
	}

	public String getErrorCode()
	{
		return m_errorCode;
	}

	public String[] getErrorArgs()
	{
		return m_errorArgs;
	}

	public void setErrorArgs(String[] errorArgs)
	{
		this.m_errorArgs = errorArgs;
	}
}