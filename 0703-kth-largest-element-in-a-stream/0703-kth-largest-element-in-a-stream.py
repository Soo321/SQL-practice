class KthLargest:
    def __init__(self, k: int, nums: list[int]):
        self.k = k  # k번째로 큰 값 유지
        self.min_heap = []  # 최소 힙 사용
        for num in nums:
            self.add(num)  # 초기 숫자들을 힙에 추가

    def add(self, val: int) -> int:
        heapq.heappush(self.min_heap, val)  # 새로운 값 추가
        if len(self.min_heap) > self.k:  # 힙 크기가 k보다 크면 가장 작은 값 제거
            heapq.heappop(self.min_heap)
        return self.min_heap[0]  # 힙의 루트가 k번째로 큰 값

        


# Your KthLargest object will be instantiated and called as such:
# obj = KthLargest(k, nums)
# param_1 = obj.add(val)