package nl.lognetd.edge;

import android.content.res.AssetManager;

/** Native subsystems protect their state; no native method opens the network. */
final class NativeBridge {
    static final boolean AVAILABLE;
    static final String LOAD_ERROR;
    static {
        boolean available = false;
        String error = "";
        try {
            System.loadLibrary("lognetd_jni");
            available = true;
        } catch (UnsatisfiedLinkError | SecurityException e) {
            error = e.toString();
        }
        AVAILABLE = available;
        LOAD_ERROR = error;
    }
    private NativeBridge() {}
    static native String describe(long availableBytes, long monotonicMs,
                                  boolean internet, boolean metered, boolean thermalSevere);
    static native String evaluateMotion(double accelerationG);
    static native String inspectLut(AssetManager assets);
    static native String runEcsFixture(long seed);
    static native String replayPhoneSnapshot(long accelerationMicroG, long availableBytes,
                                           int thermalStatus, long acquiredMonotonicNanos);
    static native String inspectBuiltinBundle(AssetManager assets);
    static native String inspectBundle(String bundlePath);
    static native String nativeProfiles();
    static native String runNativeProfile(String id, String inputHex, int steps);
    // Generations are monotonic request IDs, never native pointers.
    static native String startLiveSession(long generation);
    static native String observeLiveSession(long generation, long availableBytes,
                                           long accelerationMicroMs2, boolean accelerationValid,
                                           int thermalStatus);
    static native void stopLiveSession(long generation);
    static native String modelBackendStatus();
    static native String generate(String modelPath, String prompt, int maxTokens);
}
