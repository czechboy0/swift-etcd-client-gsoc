//
// DO NOT EDIT.
// swift-format-ignore-file
//
// Generated by the protocol buffer compiler.
// Source: etcd.proto
//
import GRPC
import NIO
import NIOConcurrencyHelpers
import SwiftProtobuf

/// Usage: instantiate `Etcdserverpb_KVClient`, then call methods of this protocol to make API calls.
protocol Etcdserverpb_KVClientProtocol: GRPCClient {
    var serviceName: String { get }
    var interceptors: Etcdserverpb_KVClientInterceptorFactoryProtocol? { get }

    func range(
        _ request: Etcdserverpb_RangeRequest,
        callOptions: CallOptions?
    ) -> UnaryCall<Etcdserverpb_RangeRequest, Etcdserverpb_RangeResponse>

    func put(
        _ request: Etcdserverpb_PutRequest,
        callOptions: CallOptions?
    ) -> UnaryCall<Etcdserverpb_PutRequest, Etcdserverpb_PutResponse>

    func deleteRange(
        _ request: Etcdserverpb_DeleteRangeRequest,
        callOptions: CallOptions?
    ) -> UnaryCall<Etcdserverpb_DeleteRangeRequest, Etcdserverpb_DeleteRangeResponse>
}

extension Etcdserverpb_KVClientProtocol {
    var serviceName: String {
        return "etcdserverpb.KV"
    }

    /// Range gets the keys in the range from the key-value store.
    ///
    /// - Parameters:
    ///   - request: Request to send to Range.
    ///   - callOptions: Call options.
    /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
    func range(
        _ request: Etcdserverpb_RangeRequest,
        callOptions: CallOptions? = nil
    ) -> UnaryCall<Etcdserverpb_RangeRequest, Etcdserverpb_RangeResponse> {
        return makeUnaryCall(
            path: Etcdserverpb_KVClientMetadata.Methods.range.path,
            request: request,
            callOptions: callOptions ?? defaultCallOptions,
            interceptors: interceptors?.makeRangeInterceptors() ?? []
        )
    }

    /// Put puts the given key into the key-value store.
    /// A put request increments the revision of the key-value store
    /// and generates one event in the event history.
    ///
    /// - Parameters:
    ///   - request: Request to send to Put.
    ///   - callOptions: Call options.
    /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
    func put(
        _ request: Etcdserverpb_PutRequest,
        callOptions: CallOptions? = nil
    ) -> UnaryCall<Etcdserverpb_PutRequest, Etcdserverpb_PutResponse> {
        return makeUnaryCall(
            path: Etcdserverpb_KVClientMetadata.Methods.put.path,
            request: request,
            callOptions: callOptions ?? defaultCallOptions,
            interceptors: interceptors?.makePutInterceptors() ?? []
        )
    }

    /// DeleteRange deletes the given range from the key-value store.
    /// A delete request increments the revision of the key-value store
    /// and generates a delete event in the event history for every deleted key.
    ///
    /// - Parameters:
    ///   - request: Request to send to DeleteRange.
    ///   - callOptions: Call options.
    /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
    func deleteRange(
        _ request: Etcdserverpb_DeleteRangeRequest,
        callOptions: CallOptions? = nil
    ) -> UnaryCall<Etcdserverpb_DeleteRangeRequest, Etcdserverpb_DeleteRangeResponse> {
        return makeUnaryCall(
            path: Etcdserverpb_KVClientMetadata.Methods.deleteRange.path,
            request: request,
            callOptions: callOptions ?? defaultCallOptions,
            interceptors: interceptors?.makeDeleteRangeInterceptors() ?? []
        )
    }
}

@available(*, deprecated)
extension Etcdserverpb_KVClient: @unchecked Sendable {}

@available(*, deprecated, renamed: "Etcdserverpb_KVNIOClient")
final class Etcdserverpb_KVClient: Etcdserverpb_KVClientProtocol {
    private let lock = Lock()
    private var _defaultCallOptions: CallOptions
    private var _interceptors: Etcdserverpb_KVClientInterceptorFactoryProtocol?
    let channel: GRPCChannel
    var defaultCallOptions: CallOptions {
        get { lock.withLock { self._defaultCallOptions } }
        set { lock.withLockVoid { self._defaultCallOptions = newValue } }
    }

    var interceptors: Etcdserverpb_KVClientInterceptorFactoryProtocol? {
        get { lock.withLock { self._interceptors } }
        set { lock.withLockVoid { self._interceptors = newValue } }
    }

    /// Creates a client for the etcdserverpb.KV service.
    ///
    /// - Parameters:
    ///   - channel: `GRPCChannel` to the service host.
    ///   - defaultCallOptions: Options to use for each service call if the user doesn't provide them.
    ///   - interceptors: A factory providing interceptors for each RPC.
    init(
        channel: GRPCChannel,
        defaultCallOptions: CallOptions = CallOptions(),
        interceptors: Etcdserverpb_KVClientInterceptorFactoryProtocol? = nil
    ) {
        self.channel = channel
        _defaultCallOptions = defaultCallOptions
        _interceptors = interceptors
    }
}

struct Etcdserverpb_KVNIOClient: Etcdserverpb_KVClientProtocol {
    var channel: GRPCChannel
    var defaultCallOptions: CallOptions
    var interceptors: Etcdserverpb_KVClientInterceptorFactoryProtocol?

    /// Creates a client for the etcdserverpb.KV service.
    ///
    /// - Parameters:
    ///   - channel: `GRPCChannel` to the service host.
    ///   - defaultCallOptions: Options to use for each service call if the user doesn't provide them.
    ///   - interceptors: A factory providing interceptors for each RPC.
    init(
        channel: GRPCChannel,
        defaultCallOptions: CallOptions = CallOptions(),
        interceptors: Etcdserverpb_KVClientInterceptorFactoryProtocol? = nil
    ) {
        self.channel = channel
        self.defaultCallOptions = defaultCallOptions
        self.interceptors = interceptors
    }
}

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
protocol Etcdserverpb_KVAsyncClientProtocol: GRPCClient {
    static var serviceDescriptor: GRPCServiceDescriptor { get }
    var interceptors: Etcdserverpb_KVClientInterceptorFactoryProtocol? { get }

    func makeRangeCall(
        _ request: Etcdserverpb_RangeRequest,
        callOptions: CallOptions?
    ) -> GRPCAsyncUnaryCall<Etcdserverpb_RangeRequest, Etcdserverpb_RangeResponse>

    func makePutCall(
        _ request: Etcdserverpb_PutRequest,
        callOptions: CallOptions?
    ) -> GRPCAsyncUnaryCall<Etcdserverpb_PutRequest, Etcdserverpb_PutResponse>

    func makeDeleteRangeCall(
        _ request: Etcdserverpb_DeleteRangeRequest,
        callOptions: CallOptions?
    ) -> GRPCAsyncUnaryCall<Etcdserverpb_DeleteRangeRequest, Etcdserverpb_DeleteRangeResponse>
}

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
extension Etcdserverpb_KVAsyncClientProtocol {
    static var serviceDescriptor: GRPCServiceDescriptor {
        return Etcdserverpb_KVClientMetadata.serviceDescriptor
    }

    var interceptors: Etcdserverpb_KVClientInterceptorFactoryProtocol? {
        return nil
    }

    func makeRangeCall(
        _ request: Etcdserverpb_RangeRequest,
        callOptions: CallOptions? = nil
    ) -> GRPCAsyncUnaryCall<Etcdserverpb_RangeRequest, Etcdserverpb_RangeResponse> {
        return makeAsyncUnaryCall(
            path: Etcdserverpb_KVClientMetadata.Methods.range.path,
            request: request,
            callOptions: callOptions ?? defaultCallOptions,
            interceptors: interceptors?.makeRangeInterceptors() ?? []
        )
    }

    func makePutCall(
        _ request: Etcdserverpb_PutRequest,
        callOptions: CallOptions? = nil
    ) -> GRPCAsyncUnaryCall<Etcdserverpb_PutRequest, Etcdserverpb_PutResponse> {
        return makeAsyncUnaryCall(
            path: Etcdserverpb_KVClientMetadata.Methods.put.path,
            request: request,
            callOptions: callOptions ?? defaultCallOptions,
            interceptors: interceptors?.makePutInterceptors() ?? []
        )
    }

    func makeDeleteRangeCall(
        _ request: Etcdserverpb_DeleteRangeRequest,
        callOptions: CallOptions? = nil
    ) -> GRPCAsyncUnaryCall<Etcdserverpb_DeleteRangeRequest, Etcdserverpb_DeleteRangeResponse> {
        return makeAsyncUnaryCall(
            path: Etcdserverpb_KVClientMetadata.Methods.deleteRange.path,
            request: request,
            callOptions: callOptions ?? defaultCallOptions,
            interceptors: interceptors?.makeDeleteRangeInterceptors() ?? []
        )
    }
}

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
extension Etcdserverpb_KVAsyncClientProtocol {
    func range(
        _ request: Etcdserverpb_RangeRequest,
        callOptions: CallOptions? = nil
    ) async throws -> Etcdserverpb_RangeResponse {
        return try await performAsyncUnaryCall(
            path: Etcdserverpb_KVClientMetadata.Methods.range.path,
            request: request,
            callOptions: callOptions ?? defaultCallOptions,
            interceptors: interceptors?.makeRangeInterceptors() ?? []
        )
    }

    func put(
        _ request: Etcdserverpb_PutRequest,
        callOptions: CallOptions? = nil
    ) async throws -> Etcdserverpb_PutResponse {
        return try await performAsyncUnaryCall(
            path: Etcdserverpb_KVClientMetadata.Methods.put.path,
            request: request,
            callOptions: callOptions ?? defaultCallOptions,
            interceptors: interceptors?.makePutInterceptors() ?? []
        )
    }

    func deleteRange(
        _ request: Etcdserverpb_DeleteRangeRequest,
        callOptions: CallOptions? = nil
    ) async throws -> Etcdserverpb_DeleteRangeResponse {
        return try await performAsyncUnaryCall(
            path: Etcdserverpb_KVClientMetadata.Methods.deleteRange.path,
            request: request,
            callOptions: callOptions ?? defaultCallOptions,
            interceptors: interceptors?.makeDeleteRangeInterceptors() ?? []
        )
    }
}

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
struct Etcdserverpb_KVAsyncClient: Etcdserverpb_KVAsyncClientProtocol {
    var channel: GRPCChannel
    var defaultCallOptions: CallOptions
    var interceptors: Etcdserverpb_KVClientInterceptorFactoryProtocol?

    init(
        channel: GRPCChannel,
        defaultCallOptions: CallOptions = CallOptions(),
        interceptors: Etcdserverpb_KVClientInterceptorFactoryProtocol? = nil
    ) {
        self.channel = channel
        self.defaultCallOptions = defaultCallOptions
        self.interceptors = interceptors
    }
}

protocol Etcdserverpb_KVClientInterceptorFactoryProtocol: Sendable {
    /// - Returns: Interceptors to use when invoking 'range'.
    func makeRangeInterceptors() -> [ClientInterceptor<Etcdserverpb_RangeRequest, Etcdserverpb_RangeResponse>]

    /// - Returns: Interceptors to use when invoking 'put'.
    func makePutInterceptors() -> [ClientInterceptor<Etcdserverpb_PutRequest, Etcdserverpb_PutResponse>]

    /// - Returns: Interceptors to use when invoking 'deleteRange'.
    func makeDeleteRangeInterceptors() -> [ClientInterceptor<Etcdserverpb_DeleteRangeRequest, Etcdserverpb_DeleteRangeResponse>]
}

enum Etcdserverpb_KVClientMetadata {
    static let serviceDescriptor = GRPCServiceDescriptor(
        name: "KV",
        fullName: "etcdserverpb.KV",
        methods: [
            Etcdserverpb_KVClientMetadata.Methods.range,
            Etcdserverpb_KVClientMetadata.Methods.put,
            Etcdserverpb_KVClientMetadata.Methods.deleteRange,
        ]
    )

    enum Methods {
        static let range = GRPCMethodDescriptor(
            name: "Range",
            path: "/etcdserverpb.KV/Range",
            type: GRPCCallType.unary
        )

        static let put = GRPCMethodDescriptor(
            name: "Put",
            path: "/etcdserverpb.KV/Put",
            type: GRPCCallType.unary
        )

        static let deleteRange = GRPCMethodDescriptor(
            name: "DeleteRange",
            path: "/etcdserverpb.KV/DeleteRange",
            type: GRPCCallType.unary
        )
    }
}

/// Usage: instantiate `Etcdserverpb_WatchClient`, then call methods of this protocol to make API calls.
protocol Etcdserverpb_WatchClientProtocol: GRPCClient {
    var serviceName: String { get }
    var interceptors: Etcdserverpb_WatchClientInterceptorFactoryProtocol? { get }

    func watch(
        callOptions: CallOptions?,
        handler: @escaping (Etcdserverpb_WatchResponse) -> Void
    ) -> BidirectionalStreamingCall<Etcdserverpb_WatchRequest, Etcdserverpb_WatchResponse>
}

extension Etcdserverpb_WatchClientProtocol {
    var serviceName: String {
        return "etcdserverpb.Watch"
    }

    /// Watch watches for events happening or that have happened. Both input and output
    /// are streams; the input stream is for creating and canceling watchers and the output
    /// stream sends events. One watch RPC can watch on multiple key ranges, streaming events
    /// for several watches at once. The entire event history can be watched starting from the
    /// last compaction revision.
    ///
    /// Callers should use the `send` method on the returned object to send messages
    /// to the server. The caller should send an `.end` after the final message has been sent.
    ///
    /// - Parameters:
    ///   - callOptions: Call options.
    ///   - handler: A closure called when each response is received from the server.
    /// - Returns: A `ClientStreamingCall` with futures for the metadata and status.
    func watch(
        callOptions: CallOptions? = nil,
        handler: @escaping (Etcdserverpb_WatchResponse) -> Void
    ) -> BidirectionalStreamingCall<Etcdserverpb_WatchRequest, Etcdserverpb_WatchResponse> {
        return makeBidirectionalStreamingCall(
            path: Etcdserverpb_WatchClientMetadata.Methods.watch.path,
            callOptions: callOptions ?? defaultCallOptions,
            interceptors: interceptors?.makeWatchInterceptors() ?? [],
            handler: handler
        )
    }
}

@available(*, deprecated)
extension Etcdserverpb_WatchClient: @unchecked Sendable {}

@available(*, deprecated, renamed: "Etcdserverpb_WatchNIOClient")
final class Etcdserverpb_WatchClient: Etcdserverpb_WatchClientProtocol {
    private let lock = Lock()
    private var _defaultCallOptions: CallOptions
    private var _interceptors: Etcdserverpb_WatchClientInterceptorFactoryProtocol?
    let channel: GRPCChannel
    var defaultCallOptions: CallOptions {
        get { lock.withLock { self._defaultCallOptions } }
        set { lock.withLockVoid { self._defaultCallOptions = newValue } }
    }

    var interceptors: Etcdserverpb_WatchClientInterceptorFactoryProtocol? {
        get { lock.withLock { self._interceptors } }
        set { lock.withLockVoid { self._interceptors = newValue } }
    }

    /// Creates a client for the etcdserverpb.Watch service.
    ///
    /// - Parameters:
    ///   - channel: `GRPCChannel` to the service host.
    ///   - defaultCallOptions: Options to use for each service call if the user doesn't provide them.
    ///   - interceptors: A factory providing interceptors for each RPC.
    init(
        channel: GRPCChannel,
        defaultCallOptions: CallOptions = CallOptions(),
        interceptors: Etcdserverpb_WatchClientInterceptorFactoryProtocol? = nil
    ) {
        self.channel = channel
        _defaultCallOptions = defaultCallOptions
        _interceptors = interceptors
    }
}

struct Etcdserverpb_WatchNIOClient: Etcdserverpb_WatchClientProtocol {
    var channel: GRPCChannel
    var defaultCallOptions: CallOptions
    var interceptors: Etcdserverpb_WatchClientInterceptorFactoryProtocol?

    /// Creates a client for the etcdserverpb.Watch service.
    ///
    /// - Parameters:
    ///   - channel: `GRPCChannel` to the service host.
    ///   - defaultCallOptions: Options to use for each service call if the user doesn't provide them.
    ///   - interceptors: A factory providing interceptors for each RPC.
    init(
        channel: GRPCChannel,
        defaultCallOptions: CallOptions = CallOptions(),
        interceptors: Etcdserverpb_WatchClientInterceptorFactoryProtocol? = nil
    ) {
        self.channel = channel
        self.defaultCallOptions = defaultCallOptions
        self.interceptors = interceptors
    }
}

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
protocol Etcdserverpb_WatchAsyncClientProtocol: GRPCClient {
    static var serviceDescriptor: GRPCServiceDescriptor { get }
    var interceptors: Etcdserverpb_WatchClientInterceptorFactoryProtocol? { get }

    func makeWatchCall(
        callOptions: CallOptions?
    ) -> GRPCAsyncBidirectionalStreamingCall<Etcdserverpb_WatchRequest, Etcdserverpb_WatchResponse>
}

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
extension Etcdserverpb_WatchAsyncClientProtocol {
    static var serviceDescriptor: GRPCServiceDescriptor {
        return Etcdserverpb_WatchClientMetadata.serviceDescriptor
    }

    var interceptors: Etcdserverpb_WatchClientInterceptorFactoryProtocol? {
        return nil
    }

    func makeWatchCall(
        callOptions: CallOptions? = nil
    ) -> GRPCAsyncBidirectionalStreamingCall<Etcdserverpb_WatchRequest, Etcdserverpb_WatchResponse> {
        return makeAsyncBidirectionalStreamingCall(
            path: Etcdserverpb_WatchClientMetadata.Methods.watch.path,
            callOptions: callOptions ?? defaultCallOptions,
            interceptors: interceptors?.makeWatchInterceptors() ?? []
        )
    }
}

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
extension Etcdserverpb_WatchAsyncClientProtocol {
    func watch<RequestStream>(
        _ requests: RequestStream,
        callOptions: CallOptions? = nil
    ) -> GRPCAsyncResponseStream<Etcdserverpb_WatchResponse> where RequestStream: Sequence, RequestStream.Element == Etcdserverpb_WatchRequest {
        return performAsyncBidirectionalStreamingCall(
            path: Etcdserverpb_WatchClientMetadata.Methods.watch.path,
            requests: requests,
            callOptions: callOptions ?? defaultCallOptions,
            interceptors: interceptors?.makeWatchInterceptors() ?? []
        )
    }

    func watch<RequestStream>(
        _ requests: RequestStream,
        callOptions: CallOptions? = nil
    ) -> GRPCAsyncResponseStream<Etcdserverpb_WatchResponse> where RequestStream: AsyncSequence & Sendable, RequestStream.Element == Etcdserverpb_WatchRequest {
        return performAsyncBidirectionalStreamingCall(
            path: Etcdserverpb_WatchClientMetadata.Methods.watch.path,
            requests: requests,
            callOptions: callOptions ?? defaultCallOptions,
            interceptors: interceptors?.makeWatchInterceptors() ?? []
        )
    }
}

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
struct Etcdserverpb_WatchAsyncClient: Etcdserverpb_WatchAsyncClientProtocol {
    var channel: GRPCChannel
    var defaultCallOptions: CallOptions
    var interceptors: Etcdserverpb_WatchClientInterceptorFactoryProtocol?

    init(
        channel: GRPCChannel,
        defaultCallOptions: CallOptions = CallOptions(),
        interceptors: Etcdserverpb_WatchClientInterceptorFactoryProtocol? = nil
    ) {
        self.channel = channel
        self.defaultCallOptions = defaultCallOptions
        self.interceptors = interceptors
    }
}

protocol Etcdserverpb_WatchClientInterceptorFactoryProtocol: Sendable {
    /// - Returns: Interceptors to use when invoking 'watch'.
    func makeWatchInterceptors() -> [ClientInterceptor<Etcdserverpb_WatchRequest, Etcdserverpb_WatchResponse>]
}

enum Etcdserverpb_WatchClientMetadata {
    static let serviceDescriptor = GRPCServiceDescriptor(
        name: "Watch",
        fullName: "etcdserverpb.Watch",
        methods: [
            Etcdserverpb_WatchClientMetadata.Methods.watch,
        ]
    )

    enum Methods {
        static let watch = GRPCMethodDescriptor(
            name: "Watch",
            path: "/etcdserverpb.Watch/Watch",
            type: GRPCCallType.bidirectionalStreaming
        )
    }
}

/// To build a server, implement a class that conforms to this protocol.
protocol Etcdserverpb_KVProvider: CallHandlerProvider {
    var interceptors: Etcdserverpb_KVServerInterceptorFactoryProtocol? { get }

    /// Range gets the keys in the range from the key-value store.
    func range(request: Etcdserverpb_RangeRequest, context: StatusOnlyCallContext) -> EventLoopFuture<Etcdserverpb_RangeResponse>

    /// Put puts the given key into the key-value store.
    /// A put request increments the revision of the key-value store
    /// and generates one event in the event history.
    func put(request: Etcdserverpb_PutRequest, context: StatusOnlyCallContext) -> EventLoopFuture<Etcdserverpb_PutResponse>

    /// DeleteRange deletes the given range from the key-value store.
    /// A delete request increments the revision of the key-value store
    /// and generates a delete event in the event history for every deleted key.
    func deleteRange(request: Etcdserverpb_DeleteRangeRequest, context: StatusOnlyCallContext) -> EventLoopFuture<Etcdserverpb_DeleteRangeResponse>
}

extension Etcdserverpb_KVProvider {
    var serviceName: Substring {
        return Etcdserverpb_KVServerMetadata.serviceDescriptor.fullName[...]
    }

    /// Determines, calls and returns the appropriate request handler, depending on the request's method.
    /// Returns nil for methods not handled by this service.
    func handle(
        method name: Substring,
        context: CallHandlerContext
    ) -> GRPCServerHandlerProtocol? {
        switch name {
        case "Range":
            return UnaryServerHandler(
                context: context,
                requestDeserializer: ProtobufDeserializer<Etcdserverpb_RangeRequest>(),
                responseSerializer: ProtobufSerializer<Etcdserverpb_RangeResponse>(),
                interceptors: interceptors?.makeRangeInterceptors() ?? [],
                userFunction: range(request:context:)
            )

        case "Put":
            return UnaryServerHandler(
                context: context,
                requestDeserializer: ProtobufDeserializer<Etcdserverpb_PutRequest>(),
                responseSerializer: ProtobufSerializer<Etcdserverpb_PutResponse>(),
                interceptors: interceptors?.makePutInterceptors() ?? [],
                userFunction: put(request:context:)
            )

        case "DeleteRange":
            return UnaryServerHandler(
                context: context,
                requestDeserializer: ProtobufDeserializer<Etcdserverpb_DeleteRangeRequest>(),
                responseSerializer: ProtobufSerializer<Etcdserverpb_DeleteRangeResponse>(),
                interceptors: interceptors?.makeDeleteRangeInterceptors() ?? [],
                userFunction: deleteRange(request:context:)
            )

        default:
            return nil
        }
    }
}

/// To implement a server, implement an object which conforms to this protocol.
@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
protocol Etcdserverpb_KVAsyncProvider: CallHandlerProvider, Sendable {
    static var serviceDescriptor: GRPCServiceDescriptor { get }
    var interceptors: Etcdserverpb_KVServerInterceptorFactoryProtocol? { get }

    /// Range gets the keys in the range from the key-value store.
    func range(
        request: Etcdserverpb_RangeRequest,
        context: GRPCAsyncServerCallContext
    ) async throws -> Etcdserverpb_RangeResponse

    /// Put puts the given key into the key-value store.
    /// A put request increments the revision of the key-value store
    /// and generates one event in the event history.
    func put(
        request: Etcdserverpb_PutRequest,
        context: GRPCAsyncServerCallContext
    ) async throws -> Etcdserverpb_PutResponse

    /// DeleteRange deletes the given range from the key-value store.
    /// A delete request increments the revision of the key-value store
    /// and generates a delete event in the event history for every deleted key.
    func deleteRange(
        request: Etcdserverpb_DeleteRangeRequest,
        context: GRPCAsyncServerCallContext
    ) async throws -> Etcdserverpb_DeleteRangeResponse
}

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
extension Etcdserverpb_KVAsyncProvider {
    static var serviceDescriptor: GRPCServiceDescriptor {
        return Etcdserverpb_KVServerMetadata.serviceDescriptor
    }

    var serviceName: Substring {
        return Etcdserverpb_KVServerMetadata.serviceDescriptor.fullName[...]
    }

    var interceptors: Etcdserverpb_KVServerInterceptorFactoryProtocol? {
        return nil
    }

    func handle(
        method name: Substring,
        context: CallHandlerContext
    ) -> GRPCServerHandlerProtocol? {
        switch name {
        case "Range":
            return GRPCAsyncServerHandler(
                context: context,
                requestDeserializer: ProtobufDeserializer<Etcdserverpb_RangeRequest>(),
                responseSerializer: ProtobufSerializer<Etcdserverpb_RangeResponse>(),
                interceptors: interceptors?.makeRangeInterceptors() ?? [],
                wrapping: { try await self.range(request: $0, context: $1) }
            )

        case "Put":
            return GRPCAsyncServerHandler(
                context: context,
                requestDeserializer: ProtobufDeserializer<Etcdserverpb_PutRequest>(),
                responseSerializer: ProtobufSerializer<Etcdserverpb_PutResponse>(),
                interceptors: interceptors?.makePutInterceptors() ?? [],
                wrapping: { try await self.put(request: $0, context: $1) }
            )

        case "DeleteRange":
            return GRPCAsyncServerHandler(
                context: context,
                requestDeserializer: ProtobufDeserializer<Etcdserverpb_DeleteRangeRequest>(),
                responseSerializer: ProtobufSerializer<Etcdserverpb_DeleteRangeResponse>(),
                interceptors: interceptors?.makeDeleteRangeInterceptors() ?? [],
                wrapping: { try await self.deleteRange(request: $0, context: $1) }
            )

        default:
            return nil
        }
    }
}

protocol Etcdserverpb_KVServerInterceptorFactoryProtocol: Sendable {
    /// - Returns: Interceptors to use when handling 'range'.
    ///   Defaults to calling `self.makeInterceptors()`.
    func makeRangeInterceptors() -> [ServerInterceptor<Etcdserverpb_RangeRequest, Etcdserverpb_RangeResponse>]

    /// - Returns: Interceptors to use when handling 'put'.
    ///   Defaults to calling `self.makeInterceptors()`.
    func makePutInterceptors() -> [ServerInterceptor<Etcdserverpb_PutRequest, Etcdserverpb_PutResponse>]

    /// - Returns: Interceptors to use when handling 'deleteRange'.
    ///   Defaults to calling `self.makeInterceptors()`.
    func makeDeleteRangeInterceptors() -> [ServerInterceptor<Etcdserverpb_DeleteRangeRequest, Etcdserverpb_DeleteRangeResponse>]
}

enum Etcdserverpb_KVServerMetadata {
    static let serviceDescriptor = GRPCServiceDescriptor(
        name: "KV",
        fullName: "etcdserverpb.KV",
        methods: [
            Etcdserverpb_KVServerMetadata.Methods.range,
            Etcdserverpb_KVServerMetadata.Methods.put,
            Etcdserverpb_KVServerMetadata.Methods.deleteRange,
        ]
    )

    enum Methods {
        static let range = GRPCMethodDescriptor(
            name: "Range",
            path: "/etcdserverpb.KV/Range",
            type: GRPCCallType.unary
        )

        static let put = GRPCMethodDescriptor(
            name: "Put",
            path: "/etcdserverpb.KV/Put",
            type: GRPCCallType.unary
        )

        static let deleteRange = GRPCMethodDescriptor(
            name: "DeleteRange",
            path: "/etcdserverpb.KV/DeleteRange",
            type: GRPCCallType.unary
        )
    }
}

/// To build a server, implement a class that conforms to this protocol.
protocol Etcdserverpb_WatchProvider: CallHandlerProvider {
    var interceptors: Etcdserverpb_WatchServerInterceptorFactoryProtocol? { get }

    /// Watch watches for events happening or that have happened. Both input and output
    /// are streams; the input stream is for creating and canceling watchers and the output
    /// stream sends events. One watch RPC can watch on multiple key ranges, streaming events
    /// for several watches at once. The entire event history can be watched starting from the
    /// last compaction revision.
    func watch(context: StreamingResponseCallContext<Etcdserverpb_WatchResponse>) -> EventLoopFuture<(StreamEvent<Etcdserverpb_WatchRequest>) -> Void>
}

extension Etcdserverpb_WatchProvider {
    var serviceName: Substring {
        return Etcdserverpb_WatchServerMetadata.serviceDescriptor.fullName[...]
    }

    /// Determines, calls and returns the appropriate request handler, depending on the request's method.
    /// Returns nil for methods not handled by this service.
    func handle(
        method name: Substring,
        context: CallHandlerContext
    ) -> GRPCServerHandlerProtocol? {
        switch name {
        case "Watch":
            return BidirectionalStreamingServerHandler(
                context: context,
                requestDeserializer: ProtobufDeserializer<Etcdserverpb_WatchRequest>(),
                responseSerializer: ProtobufSerializer<Etcdserverpb_WatchResponse>(),
                interceptors: interceptors?.makeWatchInterceptors() ?? [],
                observerFactory: watch(context:)
            )

        default:
            return nil
        }
    }
}

/// To implement a server, implement an object which conforms to this protocol.
@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
protocol Etcdserverpb_WatchAsyncProvider: CallHandlerProvider, Sendable {
    static var serviceDescriptor: GRPCServiceDescriptor { get }
    var interceptors: Etcdserverpb_WatchServerInterceptorFactoryProtocol? { get }

    /// Watch watches for events happening or that have happened. Both input and output
    /// are streams; the input stream is for creating and canceling watchers and the output
    /// stream sends events. One watch RPC can watch on multiple key ranges, streaming events
    /// for several watches at once. The entire event history can be watched starting from the
    /// last compaction revision.
    func watch(
        requestStream: GRPCAsyncRequestStream<Etcdserverpb_WatchRequest>,
        responseStream: GRPCAsyncResponseStreamWriter<Etcdserverpb_WatchResponse>,
        context: GRPCAsyncServerCallContext
    ) async throws
}

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
extension Etcdserverpb_WatchAsyncProvider {
    static var serviceDescriptor: GRPCServiceDescriptor {
        return Etcdserverpb_WatchServerMetadata.serviceDescriptor
    }

    var serviceName: Substring {
        return Etcdserverpb_WatchServerMetadata.serviceDescriptor.fullName[...]
    }

    var interceptors: Etcdserverpb_WatchServerInterceptorFactoryProtocol? {
        return nil
    }

    func handle(
        method name: Substring,
        context: CallHandlerContext
    ) -> GRPCServerHandlerProtocol? {
        switch name {
        case "Watch":
            return GRPCAsyncServerHandler(
                context: context,
                requestDeserializer: ProtobufDeserializer<Etcdserverpb_WatchRequest>(),
                responseSerializer: ProtobufSerializer<Etcdserverpb_WatchResponse>(),
                interceptors: interceptors?.makeWatchInterceptors() ?? [],
                wrapping: { try await self.watch(requestStream: $0, responseStream: $1, context: $2) }
            )

        default:
            return nil
        }
    }
}

protocol Etcdserverpb_WatchServerInterceptorFactoryProtocol: Sendable {
    /// - Returns: Interceptors to use when handling 'watch'.
    ///   Defaults to calling `self.makeInterceptors()`.
    func makeWatchInterceptors() -> [ServerInterceptor<Etcdserverpb_WatchRequest, Etcdserverpb_WatchResponse>]
}

enum Etcdserverpb_WatchServerMetadata {
    static let serviceDescriptor = GRPCServiceDescriptor(
        name: "Watch",
        fullName: "etcdserverpb.Watch",
        methods: [
            Etcdserverpb_WatchServerMetadata.Methods.watch,
        ]
    )

    enum Methods {
        static let watch = GRPCMethodDescriptor(
            name: "Watch",
            path: "/etcdserverpb.Watch/Watch",
            type: GRPCCallType.bidirectionalStreaming
        )
    }
}
