import { Suspense } from "react";
import SlowData from "./slow-data";
import Loading from "./loading";

export default function Page() {
  return (
    <div className="flex flex-col items-center justify-center h-screen">
      <div className="flex items-center mt-4">
        <h1 className="text-2xl font-bold">Loading Slow Data</h1>
        <p>Data should load in 5 seconds</p>
        <Suspense fallback={<Loading />}>
          <SlowData />
        </Suspense>
      </div>
    </div>
  );
}
