import os
import subprocess
import time


class VncManager:
    """
    Manages OS-level VNC and X11 sub-processes for headless manual auth.
    Stateless utility class ensuring environment isolation.
    """

    @staticmethod
    def cleanup_vnc_environment() -> None:
        """Strictly kills all VNC related processes and removes lock files."""
        subprocess.run(["pkill", "-9", "-f", "Xvfb"], capture_output=True)
        subprocess.run(["pkill", "-9", "-f", "x11vnc"], capture_output=True)
        subprocess.run(["pkill", "-9", "-f", "fluxbox"], capture_output=True)
        if os.path.exists("/tmp/.X99-lock"):
            try:
                os.remove("/tmp/.X99-lock")
            except OSError:
                pass

    @staticmethod
    def ensure_vnc_environment() -> None:
        """Bootstraps the X11/VNC Server dynamically if not running."""
        os.environ["DISPLAY"] = ":99"

        if not os.path.exists("/tmp/.X99-lock"):
            print("[INFO] Bootstrapping Headless VNC Environment...")
            VncManager.cleanup_vnc_environment()

            subprocess.Popen(["Xvfb", ":99", "-screen", "0", "1280x800x24"],
                stdout=subprocess.DEVNULL,
                stderr=subprocess.DEVNULL,
            )
            time.sleep(2)
            subprocess.Popen(
                ["fluxbox"], stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL
            )
            subprocess.Popen([
                    "x11vnc",
                    "-display",
                    ":99",
                    "-nopw",
                    "-listen",
                    "0.0.0.0",
                    "-xkb",
                    "-forever",
                ],
                stdout=subprocess.DEVNULL,
                stderr=subprocess.DEVNULL,
            )