// Dummy For local only distro
export class ServerConnection {
  static getForUri(): ?ServerConnection { return null; }
  static toDebugString(connection: ?ServerConnection): string { return "local"; }
  static onDidCloseServerConnection(): void {

  getRemoteHostname(): string { return ""; }
  }
}
