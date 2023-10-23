/**
 * Utility function to log messages with a timestamp.
 * @param message The message to log.
 */
function logWithTimestamp(message: string): void {
    const timestamp = new Date().toISOString();
    console.log(`[${timestamp}] ${message}`);
  }
  
  /**
   * Utility function to convert a string to Title Case.
   * @param str The string to convert.
   * @returns The string in Title Case.
   */
  function toTitleCase(str: string): string {
    return str.replace(/\w\S*/g, (txt) => {
      return txt.charAt(0).toUpperCase() + txt.substr(1).toLowerCase();
    });
  }
  
  export { logWithTimestamp, toTitleCase };
  